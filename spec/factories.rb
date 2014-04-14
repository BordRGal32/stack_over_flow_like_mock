
FactoryGirl.define do
  factory :user, :class => User do
    name { Faker::Internet.user_name }
    password "123"
    password_confirmation { |u| u.password }
  end
end
