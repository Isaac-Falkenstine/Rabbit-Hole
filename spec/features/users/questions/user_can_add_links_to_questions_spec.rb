require "rails_helper"

describe "a user visits a topic show page" do
  context "A specific question and its details are rendered on the topic show page" do
    before(:each) do
      date = Date.today - 1.days
      date_2 = Date.today - 2.days
      @user = create(:user)
      @topic = create(:topic, title: "Disability in CO", user: @user)

      @question_1 = create(:question, topic: @topic, title: "Do I need a lawyer?")

      @link_1 = create(:link, name: "Jim Rogers JD home site", url: "jimrogers.com", link_note: "Specializes in CO disability", question: @question_1)
      @link_2 = create(:link, question: @question_1, name: "Advice on getting a lawyer", url: "advice.com/lawyers", link_note: "example note 2")

      @question_2 = create(:question, topic: @topic, title: "Do I need a doctor note?", created_at: date)
      @question_3 = create(:question, topic: @topic, title: "Does it cost money?", created_at: date_2)
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

    it "allows me to add a new link" do
      visit user_topic_path(@topic)
      click_on @question_1.title

      within(".all_saved_links") do
        click_on "Add new link"
        fill_in "link[name]", with: "New link"
        fill_in "link[url]", with: "newlink.com"
        fill_in "link[description]", with: "testing a new link"
        click_on "Save"
      end
    end
  end
end
