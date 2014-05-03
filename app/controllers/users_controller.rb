class UsersController < ApplicationController
	def new
	  @user = User.new			  	
	end	

	def create
		user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
		user.save
		redirect_to user
		#creates new user and redirects to their profile page
	end	

	def show
		@user = User.find(params[:id])
	end	
end
