require "rails_helper"

describe "a user visits a topic show page" do
  context "A specific question and its details are rendered on the topic show page" do
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
    end

    it "sees a section for my links showing links I've created" do
      visit user_topic_path(@topic)
      click_on @question_1.title

      expect(page).to have_content "Saved Links"

      within(".all_saved_links") do
        expect(page).to have_content @link_1.name
        expect(page).to have_content @link_2.name
      end
    end

    it "allows me to add a new link", js: true do
      visit user_topic_path(@topic)
      click_on @question_1.title

      click_on "Add New Link"

      inputs = all('input[type="text"]')

      within("#new_link_form") do
        inputs = all('input[type="text"]')
        inputs[0].set("example name")
        inputs[1].set("example url")
      end

      click_on "Create Link"

      topic_1 = Topic.find(@topic.id)
      visit user_topic_path(topic_1)

      within(".all_saved_links") do
        expect(page).to have_content "example name"
      end

      expect(@question_1.links.count).to eq 3
    end
  end
end
