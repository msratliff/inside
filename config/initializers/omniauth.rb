Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, Rails.application.secrets['facebook_id'],
#     Rails.application.secrets['facebook_secret'], scope: "user:email"
# end

#
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, 'FACEBOOK_APP_ID', 'FACEBOOK_SECRET'
# end

provider :facebook, Rails.application.secrets['facebook_app_id'],
    Rails.application.secrets['facebook_secret'], scope: "email", info_fields: 'email,name'
  end
