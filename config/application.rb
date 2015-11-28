require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Idscomitee
  class Application < Rails::Application
    config.sass.preferred_syntax = :sass
    config.sass.line_comments = false
    config.sass.cache = false
    config.i18n.default_locale = :'es-MX'
    config.active_record.raise_in_transactional_callbacks = true
    config.active_support.escape_html_entities_in_json = false
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w(ckeditor/*)
    config.action_dispatch.default_headers = {
    'X-Frame-Options' => 'ALLOWALL'
    }
  end
end
