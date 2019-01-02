require "rails_helper"

describe "a user visits a topic show page" do
  context "A specific question and its details are rendered on the topic show page", js: true do
    before(:each) do
      date = Date.today - 1.days
      date_2 = Date.today - 2.days
      @user = create(:user)
      @topic = create(:topic, title: "Disability in CO", user: @user)

      @question_1 = create(:question, topic: @topic, title: "Do I need a lawyer?")

      @link_1 = create(:link, name: "Jim Rogers JD home site", website_link_text: "jimrogers.com", link_note: "Specializes in CO disability", question: @question_1)
      @link_2 = create(:link, question: @question_1, name: "Advice on getting a lawyer", website_link_text: "advice.com/lawyers", link_note: "example note 2")

      @question_2 = create(:question, topic: @topic, title: "Do I need a doctor note?", created_at: date)
      @question_3 = create(:question, topic: @topic, title: "Does it cost money?", created_at: date_2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      stub_request(:get, "https://api.cognitive.microsoft.com").
            to_return(body: File.read("./spec/fixtures/bing_search_results.json"))

      visit user_topic_path(@topic)
      click_on @question_2.title

      @bing_website = "https://www.disabilitybenefitshome.com/disability-benefits-blog/2012/06/do-i-need-a-doctors-note-to-qualify-for-ssa-disability/"
    end

    it "can save a bing link to saved links", js: true do
      within(first(".search_results")) do
        click_on "Save Link"
      end

      within("#new_link_form") do
        inputs = all('input[type="text"]')
        inputs[0].set("Newly added link from bing")
      end

      click_on "Create Link"

      within(".all_saved_links") do
        expect(page).to have_content "Newly added link from bing"
      end

      expect(Link.last.website_link_text).to eq @bing_website

    end
  end
end
