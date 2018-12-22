
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    # it { is_expected.to have_secure_password }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "Relations" do
    it { is_expected.to have_many(:topics) }
  end

  describe ".from_omniauth" do
    it "initializes a user if email doesnt exist" do
      data = {"provider"=>"google_oauth2",
              "uid"=>"123",
              "info"=>{"email"=>"sample@example.com", "first_name"=>"Sally", "last_name"=>"Draper"},
              "credentials"=>
              {"token"=>"123", "refresh_token"=>"123"}}

      user = User.from_omniauth(data)

      expect(user).to be_a User
    end

    it "doesnt create a user if email exists in database" do
      user_1 = create(:user, first_name: "Sue", last_name: "Blue", email:   "sue@blue.com")

      data = {"provider"=>"google_oauth2",
              "uid"=>"123",
              "info"=>{"email"=>"sue@blue.com","first_name"=>"Sue",   "last_name"=>"Purple"},
              "credentials"=>
              {"token"=>"123", "refresh_token"=>"123"}}

      user_2 = User.from_omniauth(data)

      expect(user_1.id).to eq user_2.id
    end
  end

end
