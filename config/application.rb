require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ecomicx
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.time_zone = 'UTC'
    config.time_zone = 'America/Sao_Paulo'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false
    # config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.default_locale = :'pt-BR'
    config.autoload_paths << Rails.root.join('app/resources')

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
