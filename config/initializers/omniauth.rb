Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, Rails.application.secrets['facebook_app_id'],
    Rails.application.secrets['facebook_secret'], scope: "email", info_fields: 'email,name'
  end
