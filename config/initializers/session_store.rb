# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_league_session',
  :secret      => '461584e7006518851e57595ec7353128217d011f666e53cb0fcb5504e8dd640ee1d0090677a0527eb2ca64807a4e8d28d0c16e2e9c8526cfe2f21142cba50376'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
