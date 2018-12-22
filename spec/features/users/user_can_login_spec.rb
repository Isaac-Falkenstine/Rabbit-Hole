require 'rails_helper'

describe "User can log in the APP" do
  it "user goes to login page and have success" do

    email = "fake@weirddomain.com"
    password = "123456"
    user = create(:user, email: email, password: password)

    visit '/'

    click_on "Sign in"


    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password

    click_on "Submit"

    expect(current_path).to eq(user_dashboard_path)
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

  it "user can login with Google Oauth" do
    user = User.create(first_name: "Amy", last_name: "Petrie", password: "password", email: "amy@example.com")
    GoogleOauthToken.create(token: "abcdefg12345", refresh_token: "12345abcdefg", user: user)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: "google_oauth2",
          uid: "12345678910",
          info: {
            email: "amy@example.com",
            first_name: "Amy",
            last_name: "Petrie"
          },
          credentials: {
            token: "abcdefg12345",
            refresh_token: "12345abcdefg",
            expires_at: DateTime.now,
          }
        })

    visit '/login'
    click_on "Login with Google"

    expect(current_path).to eq(user_dashboard_path)
    expect(page).to have_content("You have successfully logged in!")
  end

  it "A logged in user can log out" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_dashboard_path
    click_on "Logout"

    expect(page).to have_content("Login")
    expect(current_path).to eq root_path
  end

  it "A user cannot log in with invalid email" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_dashboard_path
    click_on "Logout"

    expect(page).to have_content("Login")
    expect(current_path).to eq root_path
  end

  it "A user cannot log in with invalid email" do
    user = create(:user, email: "amy@amy.com", password: "password")

    visit login_path

    fill_in 'session[email]', with: "amy@amdy.com"
    fill_in 'session[password]', with: "password"

    click_button "Login"

    expect(page).to have_content("Looks like your email or password is invalid")

    expect(current_path).to eq login_path
  end

end
