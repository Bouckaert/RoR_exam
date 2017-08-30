class UsersController < ApplicationController
	def create
		@user = 
		redirect_to @user, :notice => "User created!"  
	end
end
