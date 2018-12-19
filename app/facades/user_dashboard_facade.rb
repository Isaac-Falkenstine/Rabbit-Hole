class UserDashboardFacade

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def topics
    user.topics
  end
end
