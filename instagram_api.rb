# frozen_string_literal: true

require 'http'
require 'httparty'
require 'yaml'

module FlyHii
  module OpenAI
    # Library for Instagram Web API
    class Api
      config = YAML.safe_load_file('config/secrets.yml')
      access_token = config['OPENAI_TOKEN']
      fields = 'account_type,id,media_count,username'
      # API_IG_ROOT = 'https://graph.facebook.com/v18.0'
      # FIELDS = 'id,caption'

      openAI_response = {}
      openAI_results = {}

      # HAPPY account info request
      account_url = "https://graph.instagram.com/#{user_id}?fields=#{fields}&access_token=#{access_token}"
      openAI_response[account_url] = HTTParty.get(account_url)
      account_info = openAI_response[account_url].parsed_response

      openAI_results['account_type'] = account_info['account_type']
      # should be personal

      openAI_results['media_count'] = account_info['media_count']
      # should be 1

      openAI_results['username'] = account_info['username']
      # should be ???

      File.write('spec/fixtures/openAI_results.yml', openAI_results.to_yaml)

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
