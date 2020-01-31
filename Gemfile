# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt', '~> 3.1.13'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

# API
gem 'graphql', '1.9.14'
gem 'graphql-errors'
gem 'rack-cors'

# business logic
gem 'trailblazer', '2.1.0.rc1'
gem 'trailblazer-activity', '~> 0.7.1'
gem 'trailblazer-endpoint', github: 'trailblazer/trailblazer-endpoint'
gem 'trailblazer-macro', '2.1.0.rc1'
gem 'trailblazer-operation', '~> 0.4.1'
gem 'trailblazer-rails', '~> 2.1', '>= 2.1.7'

# dry-rb gems
gem 'dry-matcher', '~> 0.7.0'
gem 'dry-validation', '0.11.1'

# databases
gem 'pg', '>= 0.18', '< 2.0'
gem 'redis', '~> 4.0'

# user auth
gem 'jwt_sessions', '2.4.1'

group :development do
  gem 'annotate', '~> 3.0', '>= 3.0.3'
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'database_cleaner'
  gem 'fasterer'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_best_practices'
  gem 'rspec_junit_formatter'
  gem 'rubocop', '~> 0.75.1', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'ffaker', '~> 2.13.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
