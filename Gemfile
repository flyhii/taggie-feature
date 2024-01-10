# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

# INFRASTRUCTURE LAYER
# Networking
gem 'http', '~> 5.0'
gem 'httparty'
gem 'nokogiri'

# Asynchronicity
gem 'aws-sdk-sqs', '~> 1.48'
gem 'concurrent-ruby', '~> 1.1'

# WORKER
gem 'faye', '~> 1.4'
gem 'shoryuken', '~> 5.3'

# TESTING
group :test do
  gem 'minitest', '~> 5.0'
  gem 'minitest-rg', '~> 5.0'
  gem 'simplecov', '~> 0.0'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.0'
end

# Development
group :development do
  gem 'flog'
  gem 'reek'
  gem 'rerun', '~> 0.0'
  gem 'rubocop', '~> 1.0'
end

group :translation do
  gem 'ruby-openai'
end
