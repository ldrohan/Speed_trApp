FactoryGirl.define do 

  # excellent use of sequence
  sequence :email do |n|
    "lalalala#{n}@jackie.com"
  end	

  factory :user do
    name "Luke"
    email 
    password "password"
    password_confirmation "password"
  end	
  
  factory :trap do 
  	name nil
  	lat 3.1233456
  	long 120.755235
    # Instead of specifying a user_id here your should just call on user
    # This will build a user using the user factory and attach it to this trap
    # user_id 1
    user
  end	

end