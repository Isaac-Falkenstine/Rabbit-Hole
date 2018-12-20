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
end
