require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe "Relations" do
    it { is_expected.to belong_to(:question) }
  end
end
