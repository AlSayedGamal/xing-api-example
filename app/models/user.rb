class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable
  def self.create_from_xing(response)
  	where(provider: response.provider, uid: response.uid).first_or_create do |user|
	    user.email = response.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.first_name = response.info.first_name
	    user.last_name = response.info.last_name
	    user.image = response.info.image
	    user.url = response.info.url
	    user.token = response.credentials.token 
	    user.secret = response.credentials.secret 
	  end
  end

  def client
  	client = XingApi::Client.new(oauth_token: User.last.token, oauth_token_secret: User.last.secret)
  end
  def xing_id
  	profile[:users][0][:id]
  end
  def profile
  	XingApi::User.me(client: client)
  end
  def contacts
  	XingApi::Contact.list(xing_id, {client: client, user_fields:["photo_urls", "display_name","organisation_member"].join(",")})[:contacts][:users]
  end
end
