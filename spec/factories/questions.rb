FactoryBot.define do
  factory :question do
    topic { nil }
    sequence :title   { |n| "My Question #{n}" }
    sequence :notes_text { |n| "Big text #{n}" }
  end
end
