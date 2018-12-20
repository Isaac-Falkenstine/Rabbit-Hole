require 'rails_helper'

describe 'User' do
  describe 'can visit topic page' do
    it 'can see their topics' do
      user = create(:user)
      topic_1 = create(:topic, user_id: user.id)
      topic_2 = create(:topic, user_id: user.id, complete: true)


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      
      click_on topic_1.title


      expect(current_path).to eq(topic_path(topic_1))

      expect(page).to have_content("Search Bar")

      fill_in "Search Bar", with: "How To Speak Spanish"

      click_on "Search"

      within ".iframe" do
        expect(page).to have_content("Your Results")
      end
    end
  end
end

