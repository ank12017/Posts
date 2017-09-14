require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
config.action_mailer.default_url_options = { host: 'example.com' }
    # Settings in config/environments/* take precedence over those specified here.
    config.action_mailer.preview_path = "#{Rails.root}/lib/mailer_previews"
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
