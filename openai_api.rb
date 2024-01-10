# frozen_string_literal: true

# require 'http'
require 'httparty'
require 'yaml'
# require 'google-cloud-translate'
require_relative 'config/environment'

module FlyHii
  module Googletranslate
    # Library for Instagram Web API
    class Api
      config = YAML.safe_load_file('config/secrets.yml')
      # access_token = FlyHii::App.config.OPENAI_TOKEN
      access_token = config['GOOGLE_TOKEN']
      text = 'Hello, how are you?'
      target_language = 'es' # For example, 'es' for Spanish
      myproject_id = config['GOOGLE_CLOUD_PROJECT_ID']
      API_GOOGLE_ROOT = 'https://translation.googleapis.com/language/translate/v2'

      # Initialize the translation service using the API token
      account_url = "https://translation.googleapis.com/language/translate/v2?target=#{target_language}&key=#{access_token}&q=#{text}"

      # Example text and target language code
      translate_response = {}
      translate_results = {}

      translate_response = HTTParty.post(account_url)
      puts translate_response
      # File.write('translate_results.yml', translate_response.to_yaml)
    end
  end
end
