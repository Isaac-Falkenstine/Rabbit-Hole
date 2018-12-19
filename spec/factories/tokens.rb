FactoryBot.define do
  factory :token do
    user { nil }
    token { random(1_000_000..9_999_999) }
    token_name { "String" }
  end
end
