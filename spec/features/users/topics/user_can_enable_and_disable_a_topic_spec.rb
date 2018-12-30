require "rails_helper"

describe "User" do

  before(:each) do
    stub_request(:get, /api.cognitive.microsoft.com/).
    with(headers: {'Ocp-Apim-Subscription-Key'=>ENV['BING_API_KEY']}).
    to_return(body: File.read("./spec/fixtures/bing_search_results.json"))
  end

  scenario "Can make an in progress topic Complete" do
    user = create(:user)
    topic_1 = create(:topic, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_button("Research Complete")

    within(first(".topic_link")) do
      click_on("Research Complete")
    end
    topic = Topic.find(topic_1.id)
    expect(topic.complete).to be true
  end

  scenario "Can make a Complete topic in progress" do
    user = create(:user)
    topic_1 = create(:topic, user_id: user.id, complete: true)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    within(first(".topic_link")) do
      click_on("Reopen Research")
    end
    topic = Topic.find(topic_1.id)
    expect(topic.complete).to be false
  end
end
