require 'rails_helper'

describe 'User' do
  describe 'can visit topic page' do

  before(:each) do
      stub_request(:get, /api.cognitive.microsoft.com/).
        with(headers: {'Ocp-Apim-Subscription-Key'=>ENV['BING_API_KEY']}).
        to_return(body: File.read("./spec/fixtures/bing_search_results.json"))
    end

    it 'can add notes to a topic' do
      user = create(:user)
      topic_1 = create(:topic, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_topic_path(topic_1)

      fill_in 'Notes', with: 'I think that I should contact my local government office.'
    end
  end

  xit "can add notes to a question" do
    user = create(:user)
    topic_1 = create(:topic, user_id: user.id)
    question_1 = create(:question, topic_id: topic_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_topic_path(topic_1)

    fill_in "#{question_1.title} Notes", with: 'It looks like I do need a lawyer.'
  end
end
