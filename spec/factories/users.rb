FactoryBot.define do
  factory :user do
    sequence :first_name { |n| "Marcus#{n}" }
    sequence :last_name { |n| "Smith #{n}" }
    password { random(11111..99999) }
    sequence: mail { |n| "user@none_sense#{1}.com" }
  end
end
