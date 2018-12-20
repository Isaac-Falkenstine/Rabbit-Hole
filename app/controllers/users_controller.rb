class UsersController < ApplicationController
  def show
    @facade = UserDashboardFacade.new(current_user)
  end
end
