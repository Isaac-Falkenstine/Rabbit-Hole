FactoryBot.define do
  factory :user do
    sequence :first_name { |n| "Marcus#{n}" }
    sequence :last_name { |n| "Smith #{n}" }
    sequence :password { "Password" }
    sequence :email { |n| "user@none_sense#{1}.com" }
  end
end
