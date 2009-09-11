# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ARRails_session',
  :secret      => 'ffa9e803026d68689d1721089c1b61207592f0113c55ad94fef88dc846f5718262d289d091b2a015b4277b7e2c88f13a41f925d8853f1cfb7255aeedaa01b3f1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
