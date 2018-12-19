class UserDashboardFacade

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def complete_topics
    user.topics.where(complete: true)
  end

  def in_progress_topics
    user.topics.where(complete: false)
  end

  def questions
    topics.map do |topic|
      topic.questions
    end
  end
end
