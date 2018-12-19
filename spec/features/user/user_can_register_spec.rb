require 'rails_helper'

describe "User can sign in the APP" do
  scenario "user goes to sign in page and have success" do
    # As a registered user
    email = "fake@weirddomain.com"
    password = "123456"
    user = create(:user, email: email, password: password)

    # I visit "/"
    visit '/'
    # I click a button that says "Sign in"

    click_on "Sign in"
    # I am redirected to "/signin"
    expect(current_path).to eq(signin_path)
    # I see a form to enter in:

    fill_in :user[:email], with: email
    fill_in :user[:password], with: password

    # I click a button to "Sign In"
    click_on "Sign In"
    # I am redirected to "/dashboard"
    expect(current_path).to eq(dashboard_path)
    # I see a flash message "Logged in as Amy Petrie" (first and last name)
    expect(page).to have_content("#{user.first_name} #{user.last_name}")
  end
end
