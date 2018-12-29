FactoryBot.define do
  factory :link do
    question { nil }
    sequence  :name { |n| "Link number #{n}" }
    sequence  :website_link_text { |n| "https://www.fake_url.com/#{n}" }
  end
end
