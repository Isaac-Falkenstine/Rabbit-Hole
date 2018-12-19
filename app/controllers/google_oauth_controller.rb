require 'pry'

class GoogleOauthController < ApplicationController

  def update
    data = request.env["omniauth.auth"]
    user = User.from_omniauth(data)
    if user.save
      flash[:message] = "Account Created!"
      GoogleOauthToken.create(token: data.credentials.token, user: user)
      refresh_token = data.credentials.refresh_token
      user.google_oauth_tokens.create(refresh_token: refresh_token) if refresh_token.present?
      redirect_to root_path
    else
      flash[:message] = "Google Authorization was unable to be completed."
      redirect_to root_path
    end
  end

end
