require_relative 'boot'
require_relative '../lib/opbeans_shuffle'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Opbeans
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    middleware.use Rack::Static,
      urls: [%r{/images}, %r{/static}],
      root: Rails.root.join('frontend', 'build').to_s

  end
end
