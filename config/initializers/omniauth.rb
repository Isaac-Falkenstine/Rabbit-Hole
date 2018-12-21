Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: 'userinfo.email,userinfo.profile,https://www.google.com/m8/feeds',
    access_type: 'offline',
    approval_prompt: '',
    prompt: 'select_account',
    client_options: {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}
  }
end
