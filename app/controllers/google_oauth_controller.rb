require 'pry'

class GoogleOauthController < ApplicationController

  def update
    data = request.env["omniauth.auth"]
    user = User.from_omniauth(data)
    refresh_token = data.credentials.refresh_token
    if user.id != nil
      session[:user_id] = user.id
      user.google_oauth_token.update(refresh_token: refresh_token) if refresh_token.present?
      flash[:notice] = "You have successfully logged in!"
      redirect_to dashboard_path
    elsif user.save
      GoogleOauthToken.create(token: data.credentials.token, user: user, refresh_token: refresh_token)
      session[:user_id] = user.id
      flash[:notice] = "Account Created!"
      redirect_to dashboard_path
    else
      flash[:notice] = "Google Authorization was unable to be completed."
      redirect_to root_path
    end
  end
end
