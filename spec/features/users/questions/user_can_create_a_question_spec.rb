require 'rails_helper'

describe 'User' do
  describe 'visits topic show page' do
    it "can create a question" do
      user = create(:user)
      topic_1 = create(:topic, user: user, title: "Disabilty in Colorado")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_topic_path(topic_1)

      fill_in 'question[title]', with: "Do I need a lawyer?"
      click_on "Ask"

      expect(page).to have_content("Questions Asked:")
      expect(page).to have_content("Do I need a lawyer?")
      expect(page).to have_content("Bing results:")
      expect(page).to have_css(".search_results", count: 5)
    end
  end
end
