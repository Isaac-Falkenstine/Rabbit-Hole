require 'rails_helper'

describe 'BingService' do
  it "exists" do
    user = create(:user)
    topic = create(:topic, user: user)
    service = BingService.new(topic)

    expect(service).to be_a(BingService)
  end

  context "instance methods" do
    context "#results_json" do
      it "returns a array of 5 link objects" do
        VCR.use_cassette("bing_service_results") do
          user = create(:user)
          topic = create(:topic, title: "Photography", user: user)
          question = create(:question, title: "What is a film camera?", topic: topic)
          service = BingService.new(topic)

          expect(service.results(question)).to be_a(Hash)
          expect(service.results(question)).to have_key(:webPages)
          expect(service.results(question)[:webPages]).to have_key(:value)
          expect(service.results(question)[:webPages][:value].first).to have_key(:name)
          expect(service.results(question)[:webPages][:value].first).to have_key(:url)
        end
      end
    end
  end
end
