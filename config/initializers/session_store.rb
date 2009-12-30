# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => 'mongobook_session',
  :secret      => '91322d11d2b0e7bb9aa9617f6655a53a37bff286f7ca195c411255a9309700b90d736cc310a8b80926b3cdb41f5cf4042a937649d8ab715a56a5b53a1d585ca4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
