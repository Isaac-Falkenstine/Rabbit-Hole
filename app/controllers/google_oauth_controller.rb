class GoogleOauthController < ApplicationController

  def update
    data = request.env["omniauth.auth"]
  end

end
