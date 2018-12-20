Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    :name => "google_oauth2",
    :scope => ['email','profile','openid'],
    :prompt => "select_account",
    :access_type => 'offline'
  }
end
