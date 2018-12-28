require "rails_helper"

RSpec.describe BingLink, type: :model do
  it "it exists" do
    user = create(:user)
    topic = create(:topic, title: "Disability in IL", user: user)
    question = create(:question, title: "Do I need a lawyer?", topic: topic)

    data =   {
              "id": "https://api.cognitive.microsoft.com/api/v7/#WebPages.0",
              "name": "Colorado Social Security Disability Lawyers",
              "url": "https://www.disability-benefits-help.org/social-security-attorney/colorado",
              "displayUrl": "https://www.disability-benefits-help.org/social-security-attorney/...",
              "snippet": "When it comes to being awarded social security disability benestate of Colorado, there are a few          things applicants should consider before beapplication process. On a national scale, SSD benefits are not easy to           get. Oninitial disability claims are awarded; that percentage is the same for tColorado.",
              "dateLastCrawled": "2018-12-18T00:48:00"
            }
    bing_link = BingLink.new(data, question)
    expect(bing_link).to be_a BingLink
  end
end
