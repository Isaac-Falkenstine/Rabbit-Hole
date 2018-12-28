class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Registered as #{user.first_name} #{user.last_name}"
      redirect_to dashboard_path
    else
      flash[:error] = "Please check your email and password information"
      redirect_to register_path
    end
  end

  def show
    @facade = UserDashboardFacade.new(current_user)
  end
private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
