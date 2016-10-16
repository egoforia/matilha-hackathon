require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'yaml'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MatilhaHackathon
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.paperclip_defaults = {
      :storage => :s3,
      :s3_region => ENV['AWS_REGION'],
      :s3_host_name => "s3-#{ENV['AWS_REGION']}.amazonaws.com/elasticbeanstalk-sa-east-1-351157937170",
      :bucket => ENV['S3_BUCKET_NAME']
    }

    ActionMailer::Base.smtp_settings = {
      :address => "smtp.sendgrid.net",
      :port => 25,
      :domain => "nicestart.com",
      :authentication => :plain,
      :user_name => ENV["SENDGRID_USERNAME"],
      :password => ENV["SENDGRID_PASSWORD"]
    }
  end
end
