FactoryGirl.define do
	factory :user do
	  email "Bob@example.com"
    password "Bob"
    last_name "Example"
    admin false	
	end	
end