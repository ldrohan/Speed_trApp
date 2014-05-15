require 'spec_helper'
describe "Users response" do

  #I added this to create data for the creating users spec
  before :each do
    @user_attributes = FactoryGirl.attributes_for(:user)
  end
	
  describe "root path" do
  	it "should pass" do
  	get "/" 
  	response.status.should be(200)
  	end
  end	

  describe "new users" do
    # should Pass isn't a very good description of what should happen in this feature
    # you could try something like it 'should render new form' or
    # it 'should responde with 200'
  	it "should Pass" do
  	 get "/users/new"
  	 response.status.should be(200)
  	end
  end	

  describe "creating user" do
    it "should Pass" do
    #This test was failing because no attributes were getting passed in to create a user with.
  	post "/users", user: @user_attributes
  	response.status.should be(302)
  	end
  end	

end  




# resources :sessions
#   root 'users#new'

#   get'/users/new', to: 'users#new', as: 'users_new'
#   post '/users', to: 'users#create', as: 'users'
#   get '/users/:id', to: 'users#show', as: 'user'
  
#   get '/traps/new', to: 'traps#new', as: 'trap'
#   post '/traps', to: 'traps#create' 
#   get '/traps/show', to: 'traps#show' 

#   delete '/signout', to: 'sessions#destroy'
#   get '/signin', to: 'sessions#new'