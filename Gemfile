# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'graphql', '1.9.14'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'redis', '~> 4.0'

gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'ffaker', '~> 2.13.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
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

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
