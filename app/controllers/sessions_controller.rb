class SessionsController < ApplicationController
  def new

  end

<<<<<<< HEAD
=======

>>>>>>> e155d34f949335c48da329e0bea40d304fafedf7
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_dashboard_path
    else
      flash[:error] = "Looks like your email or password is invalid"
      redirect_to login_path
    end
  end
<<<<<<< HEAD
  
=======


>>>>>>> e155d34f949335c48da329e0bea40d304fafedf7
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
