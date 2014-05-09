require 'spec_helper'
describe "Users response" do  
	
  describe "root path" do
  	it "should pass" do
  	get "/" 
  	response.status.should be(200)
  	end
  end	

  describe "new users" do
  	it "should Pass" do
  	 get "/users/new"
  	 response.status.should be(200)
  	end
  end	

  describe "creating user" do
    it "should Pass" do
  	post "/users"
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