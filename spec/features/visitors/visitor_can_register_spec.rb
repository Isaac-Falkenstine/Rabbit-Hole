require "rails_helper"

describe 'As a visitor' do
  it 'I cannot register with existing email' do

    password = "password"
    user_1 = create(:user, email: "amy@amy.com", password: password)

    visit '/register'

    fill_in 'user[email]', with: "amy@amy.com"
    fill_in 'user[first_name]', with: "Abby"
    fill_in 'user[last_name]', with: "Smith"
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    within(".submit_register") do
      click_on "Register"
    end

    expect(page).to have_content("Please check your email and password information")
  end

  it 'I can register with a new email' do

    password = "password"

    visit '/register'

    fill_in 'user[email]', with: "amy@amy.com"
    fill_in 'user[first_name]', with: "Abby"
    fill_in 'user[last_name]', with: "Smith"
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    within(".submit_register") do
      click_on "Register"
    end

    expect(page).to have_content("Registered as Abby Smith")
  end

end
