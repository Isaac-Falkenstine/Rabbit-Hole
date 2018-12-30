require "rails_helper"

describe 'As a visitor' do
  it 'I can register using Google Oauth' do
    visit '/register'

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: "google_oauth2",
          uid: "12345678910",
          info: {
            email: "google_example@example.com",
            first_name: "John",
            last_name: "Doe"
          },
          credentials: {
            token: "123",
            refresh_token: "456",
            expires_at: DateTime.now,
          }
        })
    click_on "Register with Google"

    expect(page).to have_content("John Doe")
    expect(current_path).to eq dashboard_path
    expect(page).to have_content("Account Created!")
  end

  it 'cannot register using Google Oauth if oauth is invalid' do
    visit '/register'

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({"bad_credentials" => "bad_credentials"})
    click_on "Register with Google"

    expect(page).to have_content("Google Authorization was unable to be completed.")
  end
end
