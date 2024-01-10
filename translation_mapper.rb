# frozen_string_literal: true

require_relative 'google_translation_api'

module FlyHii
  # Provides access to hashtag data
  module Googletranslate
    # Data Mapper: Instagram contributor -> Hashtag entity
    class TranslationMapper
      def initialize(google_token, gateway_class = Googletranslate::Api)
        @token = google_token
        @gateway = gateway_class.new(@token)
        @data = []
      end

      def translate(target_language, content)
        # puts @token
        @gateway.translation(target_language, content)
      end
    end
  end
end
