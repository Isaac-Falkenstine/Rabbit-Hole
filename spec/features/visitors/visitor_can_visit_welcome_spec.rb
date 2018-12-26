require 'rails_helper'

feature "visitors go to the welcome page" do
  scenario "and see login/register buttons" do
    visit "/"

    expect(page).to have_content("Login")
    expect(page).to have_content("Register")
    expect(page).to have_content("Welcome")
  end
end
