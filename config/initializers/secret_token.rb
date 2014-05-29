# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file.
		token = Securerandom.hex(64)
		File.write(token_file,token)
		token
	end
end

SampleApp::Application.config.secret_key_base = '985a3eda26bd34188e32f97a885f925bb03ad98407a9e06b7c34f02516ed68ad3512020db181e4e7c5ef210ed0b3e408570774838913ed01922b208e3d223640'
