class UsersController < ApplicationController
	def new
	  @user = User.new			  	
	end	

	def create
	  user = User.new(user_params)
		if user.save
			# you should sign_in your user here when there account is created
		  flash[:success] = "You have successfully created an Account."
		  redirect_to user
		else
		  flash[:error] = "The new user cannot be saved. Please try again."
		  redirect_to user  
		end  
		#creates new user and redirects to their profile page
	end	

	def show
      @user = User.find(params[:id])
	end	

	# You should have some authorization that blocks the unintended user from accessing
	# this method.
	def update
  	  @user = User.find(params[:id])
  	  @user.update_attributes(user_params)
  	  redirect_to @user    
	end	

	private
	def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation)	
	end	
end
