require 'rails_helper'

describe "User can create a new topic" do
  scenario "User goes to dashboard and create a new topic" do
    # As a registered user,
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit “/dashboard”,
    visit dashboard_path
    # And I click a button that says “Create New Topic”,
    click_on "Create New Topic"
    # I am redirected to “/my_username/topics/new”.
    expect(current_path).to eq("/#{user.first_name}/topics/new")
    # I see text that says
    text_1 = "What do you want to learn about? What do you want to learn to do? Type your response below to create a new topic."
    expect(page).to have_content(text_1)
    # And below I fill in a form field with ,
    fill_in "new_topic[title]", with: "How to get disability in IL"
    # And below I see text that says
    text_2 = "We support your journey to learn something new. What do you want to do, make, or create once the hard work pays off?"
    expect(page).to have_content(text_2)
    # And below I fill in a form field with "
    fill_in "new_topic[goal]", with: "Either apply for disability or rule it out as an option."
    # And below I see text that says
    text_3 = "What is one specific question you have to get started?"
    expect(page).to have_content(text_3)
    # And below I fill in a form field with "Do I need a lawyer?"
    fill_in "new_topic[question]", with: "Do I need a lawyer?"
    # And below I see text that says "Don't know where to start? Thats a perfect spot! Click <here - this is a link - THIS IS ADDRESSED IN STORY 23> for links to resources on your topic to get you started and automatically create your first Question. Read, watch, and write notes until you have one or more narrower questions in mind, then create a new Question or save them for later!"

    # And I click on a button that says “Create Topic”,
    click_on "Create New Topic"
    # Then I am redirected to the topic show page “/my_username/topic/10”
    expect(current_path).to eq(user_topic_path(user))
  end
end
