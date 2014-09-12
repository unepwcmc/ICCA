
# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

GOOGLE_MAPS_KEY = "ABQIAAAAeHILri4AWFPUe0-e6P_4ABQ5R5Myl8ql1yuPsFsd7WCm78zulxT5_xrxqOUC67T8fneBIjfbHg80qw"

# See everything in the log (default is :info)
# config.log_level = :debug

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# Enable threaded mode
# config.threadsafe!

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

#set delivery method to :smtp, :sendmail or :test
config.action_mailer.delivery_method = :smtp

config.action_mailer.default_content_type = "text/html"

#ActionMailer::Base.smtp_settings = {
#  :address        => "smtp.sendgrid.net",
#  :port           => "25",
#  :authentication => :plain,
#  :user_name      => ENV['SENDGRID_USERNAME'],
#  :password       => ENV['SENDGRID_PASSWORD'],
#  :domain         => ENV['SENDGRID_DOMAIN'],
#}

