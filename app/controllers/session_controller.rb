class SessionController < Devise::OmniauthCallbacksController
	def xing
  	Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>."
		Rails.logger.info request.env['omniauth.auth'].to_json
		@user = User.create_from_xing(request.env['omniauth.auth'])
		if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Xing") if is_navigational_format?
    else
      session["devise.xing_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
	end
end