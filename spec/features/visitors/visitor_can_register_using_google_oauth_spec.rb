require "rails_helper"

describe 'As a visitor' do
  it 'I can register using Google Oauth' do
    visit '/'
    click_on "Sign Up"
    click_on "Register with Google"


    # stub_request(:get, "https://api.github.com/user/repos").
    #     to_return(body: File.read("./spec/fixtures/user_repos_2.json"))

  end
end


# stub_request(:get, "https://api.github.com/user/repos").
#     to_return(body: File.read("./spec/fixtures/user_repos_2.json"))
#
#     stub_request(:get, "https://api.github.com/user/followers").
#         to_return(body: File.read("./spec/fixtures/followers.json"))
#
#         stub_request(:get, "https://api.github.com/user/following").
#             to_return(body: File.read("./spec/fixtures/user_following.json"))
#
# OmniAuth.config.test_mode = true
# OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
#   "credentials"=>{"token"=> ENV["github_access_token"], "expires"=>false}})
#
# user = create(:user, token: nil)
# # OmniAuth.config.add_mock(:github)
# allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#
# visit dashboard_path
#
# click_on "Connect to GitHub"
#
# expect(user.token).to eq(ENV["github_access_token"])
