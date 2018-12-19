require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
