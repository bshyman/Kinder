Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
  {
    :name => "google",
    :scope => "calendar, profile, email",
    :prompt => "select_account",
    :image_aspect_ratio => "original",
    :image_size => 500,
    :access_type => "offline"
  }
end
