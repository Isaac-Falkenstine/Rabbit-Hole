class UserDashboardFacade

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def full_name
    user.first_name + " " + user.last_name
  end

  def complete_topics
    user.topics.where(complete: true)
  end

  def in_progress_topics
    user.topics.where(complete: false)
  end

  def user_topics_count
    user.topics.count
  end
end
