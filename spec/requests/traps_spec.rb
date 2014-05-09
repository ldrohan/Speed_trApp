require 'spec_helper'

describe 'traps response' do

  describe "new traps" do 
		it "should pass - yay" do
  	get "/traps/new"
  	response.status.should be(302)
    end	
  end

  describe "showing all traps page" do
  	it "should also pass" do
  		get "/traps/show" 
  		response.status.should be(200)	
  	end
  end		

end
# get '/traps/new', to: 'traps#new', as: 'trap'
#   post '/traps', to: 'traps#create' 
#   get '/traps/show', to: 'traps#show' 