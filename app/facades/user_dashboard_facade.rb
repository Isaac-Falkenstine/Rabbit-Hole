class UserDashboardFacade

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def topics
    user.topics
  end

  def questions
    topics.map do |topic|
      topic.questions
    end
  end
end
