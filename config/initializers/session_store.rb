# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ICCA_session',
  :secret      => '27e0fcf440f8adcdd6342e437893cea55e5b6b1ab3c8fccd06a3e18b8cb10d3e7a5effd222dc1810c3ee6e2b11039134d6b6c787174966dd4341831fab841a77'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
