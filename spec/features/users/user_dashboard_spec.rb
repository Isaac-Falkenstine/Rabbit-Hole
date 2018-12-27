require 'rails_helper'

describe 'User' do
  describe 'on the dashboard page' do
    it 'can see their topics' do
      user = create(:user)
      topic_1 = create(:topic, user_id: user.id)
      topic_2 = create(:topic, user_id: user.id, complete: true)


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_dashboard_path

      expect(page).to have_content(topic_1.title)
      expect(page).to have_content(topic_2.title)
      expect(page).to have_content("Research began on #{topic_1.created_at}")
      expect(page).to have_content("Research updated on #{topic_2.updated_at}")

    end

    it 'can see topics in their correct sections' do
      user = create(:user)
      topic_1 = create(:topic, user_id: user.id, complete: true)
      topic_2 = create(:topic, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_dashboard_path

      within(".complete_topics") do
        expect(page).to have_content(topic_1.title)
        expect(page).to_not have_content(topic_2.title)
      end

      within(".in_progress_topics") do
        expect(page).to have_content(topic_2.title)
        expect(page).to_not have_content(topic_1.title)
      end
    end

    it 'can click on a topic to get to its show page' do

        stub_request(:get, /api.cognitive.microsoft.com/).
          with(headers: {'Ocp-Apim-Subscription-Key'=>ENV['BING_API_KEY']}).
          to_return(body: File.read("./spec/fixtures/bing_search_results.json"))

      user = create(:user)
      topic_1 = create(:topic, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_dashboard_path
      click_on topic_1.title

      expect(current_path).to eq(user_topic_path(topic_1))
    end
  end
end
