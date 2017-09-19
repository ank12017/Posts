OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '471630079883517', '989b8aef80910c4efd6e664fe5733a4a'
end