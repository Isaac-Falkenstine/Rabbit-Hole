require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "Relations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:questions) }
  end

  describe "Instace Methods" do
    it "Created_at_format" do
      user = create(:user)
      now = Time.parse("Thu Nov 29 14:33:20 GMT 2001")
      topic = create(:topic, user: user, created_at: now, updated_at: now)

      expect(topic.created_at_format).to eq("Thu, 29 November of 2001")
    end

    it "Updated_at_format" do
      user = create(:user)
      now = Time.parse("Thu Nov 29 14:33:20 GMT 2001")
      topic = create(:topic, user: user, created_at: now, updated_at: now)

      expect(topic.updated_at_format).to eq("Thu, 29 November of 2001")
    end
  end
end
