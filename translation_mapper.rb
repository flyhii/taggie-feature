# frozen_string_literal: true

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
        puts translated_content = @gateway.translation(target_language, content)
        translated_content
      end
    end
  end
end
