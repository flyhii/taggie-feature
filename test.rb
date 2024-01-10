# frozen_string_literal: true

require_relative 'translation_mapper'
require_relative 'config/environment'

puts FlyHii::Googletranslate::TranslationMapper
  .new(FlyHii::App.config.GOOGLE_TOKEN)
  .translate('es', 'Hello, how are you?')
