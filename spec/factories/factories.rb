FactoryGirl.define do 

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
  end	
end