FactoryGirl.define do
  factory :member do
    name     "Saurabh Mandaokar"
    email    "saurabh@mandaokar.com"
    password "foobar"
    password_confirmation "foobar"
    joined_on "2009"
    department_id "8"
  end
end
