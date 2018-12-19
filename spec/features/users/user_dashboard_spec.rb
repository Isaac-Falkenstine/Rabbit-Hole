require 'rails_helper'

describe 'User' do
  describe 'on the dashboard page' do
    it 'can see their topics' do
      user = create(:user)
      create(:topic, user_id: user.id)

      visit '/dashboard'

      expect(page).to have_content("This is freakin epic lois")
    end
  end
end
