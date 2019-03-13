# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'slack-ruby-bot'
gem 'puma'
gem 'sinatra'
gem 'dotenv'
gem 'celluloid-io'
gem 'activesupport'
gem 'open-weather'

group :development, :test do
  gem 'rake'
  gem 'foreman'
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'vcr'
  gem 'webmock'
end
