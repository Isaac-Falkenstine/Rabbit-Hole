FactoryBot.define do
  factory :question do
    topic { nil }
    sequence :title   { |n| "My Question #{n}" }
  end
end
