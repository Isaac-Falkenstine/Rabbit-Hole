require 'rails_helper'

RSpec.describe 'User' do
  it 'gets error when logging in with wrong credentials' do 
    
  visit login_path 
  
    within '.login_form_field' do

    fill_in 'session_email', with: 'woof@woogiie.com'
    fill_in 'session_password', with: '924u2940u'
  end
  
  within '.login_submit' do
      click_on 'Sign in'
  end

    expect(page).to have_content("Looks like your email or password is invalid")
  end
end