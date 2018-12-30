require 'rails_helper'

describe "User can create a new topic" do

  before(:each) do
    stub_request(:get, /api.cognitive.microsoft.com/).
      with(headers: {'Ocp-Apim-Subscription-Key'=>ENV['BING_API_KEY']}).
      to_return(body: File.read("./spec/fixtures/bing_search_results.json"))

  end

  scenario "User goes to dashboard and create a new topic" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    click_on "Create New Topic"

    expect(current_path).to eq(new_user_topic_path)

    fill_in "topic[title]", with: "How to get disability in IL"
    fill_in "topic[goal]", with: "Either apply for disability or rule it out as an option."
    click_on "Create New Topic"

    topic = Topic.last

    expect(current_path).to eq(user_topic_path(topic))
    expect(page).to have_content(topic.title)
  end

    scenario "User gets flash when topic creation fails" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Create New Topic"

    expect(current_path).to eq(new_user_topic_path)


    fill_in "topic[goal]", with: "jskf"

    click_on "Create New Topic"


    expect(page).to have_content("Topic couldn't be saved, fill all the forms")
  end
end
