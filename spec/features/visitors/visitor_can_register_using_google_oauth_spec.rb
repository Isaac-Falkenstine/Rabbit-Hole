require "rails_helper"

describe 'As a visitor' do
  it 'I can register using Google Oauth' do
    visit '/'
    click_on "Register"

    
  end
end
