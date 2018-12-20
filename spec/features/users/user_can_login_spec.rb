require 'rails_helper'

describe "User can log in the APP" do
  scenario "user goes to login page and have success" do

    email = "fake@weirddomain.com"
    password = "123456"
    user = create(:user, email: email, password: password)

    visit '/'

    click_on "Sign in"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password

    click_on "Submit"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("#{user.first_name} #{user.last_name}")
    expect(page).to_not have_content("Sign in")
  end

  scenario "when logged in a user can logout" do
    email = "fake@weirddomain.com"
    password = "123456"
    user = create(:user, email: email, password: password)

    visit '/'

    click_on "Sign in"

    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password

    click_on "Submit"

    click_on "Log out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign in")
  end
end
