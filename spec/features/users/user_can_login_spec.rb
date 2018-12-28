require 'rails_helper'

describe "User can log in the APP" do
  scenario "user goes to login page and have success" do

    email = "fake@weirddomain.com"
    password = "123456"
    user = create(:user, email: email, password: password)

    visit login_path

    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password

    within(".login_submit") do
      click_on "Sign in"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("#{user.first_name} #{user.last_name}")
    expect(page).to_not have_content("Sign in")
  end

  scenario "when logged in a user can logout" do
    email = "fake@weirddomain.com"
    password = "123456"
    user = create(:user, email: email, password: password)

    visit login_path

    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password

    within(".login_submit") do
      click_on "Sign in"
    end

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
  end
end
