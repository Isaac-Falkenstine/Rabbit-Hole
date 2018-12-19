FactoryBot.define do
  factory :link do
    question { nil }
    sequence  :name { |n| "Link number #{n}" }
    sequence  :url { |n| "https://www.fake_url.com/#{n}" }
    status { 0 }
  end
end
