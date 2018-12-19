FactoryBot.define do
  factory :topic do
    user { nil }
    sequence :title   { |n| "Topic number#{n}" }
    sequence :goal { |n| "complete_this_thing#{n}" }
    complete { false }
  end
end
