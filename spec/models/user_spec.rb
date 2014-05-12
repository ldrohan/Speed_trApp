require 'spec_helper'

describe User do

	describe 'email' do

		it 'should not be empty' do
      user = FactoryGirl.build(:user, email: nil)
      user.should_not be_valid
    end  
  	it 'should be formatted correctly' do
      # Good use of factories
  		user2 = FactoryGirl.build(:user, email: "fake_email")
  		user2.should_not be_valid
  	end

  end
  	
  # This spec is still testing the validity of email, so I would nest it under the email describe
  describe 'uniqueness' do
   	it 'should be unique' do
      user_1 = FactoryGirl.create(:user)
      user_2 = FactoryGirl.build(:user, email: user_1.email)
      user_2.should_not be_valid
    end
  end	

  # You test email very thouroughly but there are no specs for your other validations
  # There is also no spec for creating a remember token. 
  # That is a pretty important feature so I would definitely test it.

end
