class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:profile, :contacts]
	def profile
		@user = current_user
		@profile = current_user.profile
	end
	def contacts
		@user = current_user
		@contacts = @user.contacts
	end
end
