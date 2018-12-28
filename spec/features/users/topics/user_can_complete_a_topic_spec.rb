require 'rails_helper'

describe"User" do
  before(:each) do
    stub_request(:get, /api.cognitive.microsoft.com/).
    with(headers: {'Ocp-Apim-Subscription-Key'=>ENV['BING_API_KEY']}).
    to_return(body: File.read("./spec/fixtures/bing_search_results.json"))
  end

  scenario "Can complete a topic " do
    user = create(:user)
    topic_1 = create(:topic, user: user)
    topic_2 = create(:topic, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "#{topic_1.title}"

    expect(current_path).to eq(user_topic_path(topic_1))

    expect(page).to have_content("If your journey is complete and your goal achieved")
    click_on("Complete Topic")

    expect(current_path).to eq(dashboard_path)

    within('.complete_research') do
      expect(page).to have_content("#{topic_1.title}")
    end
  end
end
