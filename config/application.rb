require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kiroku
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.autoloader = :classic
   # config.autoload_paths += %W(#{config.root}/lib/html_builder.rb)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ja 
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.time_zone = "Tokyo"
    #ストロングパラメーターの指定漏れを教えてくれる
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.hosts << '.example.com'
  end
end
