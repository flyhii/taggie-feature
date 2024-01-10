# frozen_string_literal: true

# require 'http'
# require 'httparty'
require 'yaml'
require 'openai'
require_relative 'config/environment'

module FlyHii
  module Openai
    # Library for Instagram Web API
    class Api
      # config = YAML.safe_load_file('config/secrets.yml')
      access_token = FlyHii::App.config.OPENAI_TOKEN

      target_language = 'Mandarin'
      text = 'Hello, my name is John. I am from the United States.'

      client = OpenAI::Client.new(access_token:)

      response = client.chat(
        parameters: {
          model: 'gpt-3.5-turbo', # Required.
          messages: [{ role: 'user', content: "Translate the following text into #{target_language}: #{text}" }],
          temperature: 0.7
        }
      )

      File.write('spec/fixtures/openAI_results.yml', response.to_yaml)

      # def initialize(token, user_id)
      #   @ig_token = token
      #   @ig_user_id = user_id
      # end

      # def hashtag(hashtag_name)
      #   Request.new(API_IG_ROOT, @ig_user_id, @ig_token)
      #     .hashtag_url(hashtag_name)
      # end

      # # request url
      # class Request
      #   def initialize(resource_root, ig_user_id, token)
      #     @resource_root = resource_root
      #     @user_id = ig_user_id
      #     @token = token
      #   end

      #   def hashtag_url(hashtag_name)
      #     url = "#{@resource_root}/ig_hashtag_search?user_id=#{@user_id}&q=#{hashtag_name}&access_token=#{@token}"
      #     InstagramApiResponseHandler.handle(url)
      #   end
      # end

      # # increase one module to deal with HTTP request
      # module HTTPRequestHandler
      #   def self.get(url)
      #     HTTParty.get(url)
      #   end
      # end

      # # take the get url response
      # class InstagramApiResponseHandler
      #   def self.handle(url)
      #     # use new HTTPRequestHandler
      #     response = HTTPRequestHandler.get(url)

      #     Response.new(response).tap do |inner_response|
      #       raise(inner_response.error) unless inner_response.successful?
      #     end
      #   end
      # end

      # # Decorates HTTP responses from Instagram with success/error reporting
      # class Response < SimpleDelegator
      #   # Represents an unauthorized access error
      #   Unauthorized = Class.new(StandardError)
      #   # Represents a not found error
      #   NotFound = Class.new(StandardError)

      #   HTTP_ERROR = {
      #     401 => Unauthorized,
      #     404 => NotFound
      #   }.freeze

      #   def successful?
      #     HTTP_ERROR.keys.none?(code)
      #   end

      #   def error
      #     HTTP_ERROR[code]
      #   end
      # end
    end
  end
end
