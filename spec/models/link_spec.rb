require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:website_link_text) }
  end

  describe "Relations" do
    it { is_expected.to belong_to(:question) }
  end

  it "exists" do
    user = create(:user)
    topic = create(:topic, user: user)
    question = create(:question, topic: topic)
    link = create(:link, question: question)

    expect(link).to be_a Link
  end
end
