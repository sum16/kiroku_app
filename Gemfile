source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem "kaminari"
gem 'bcrypt', '~> 3.1.7'
gem "bullet"
gem "nokogiri"
gem "date_validator"
gem 'google-api-client', '0.9.20', require: 'google/apis/youtube_v3'
gem 'ransack'

# gem 'redis', '~> 4.0'
# gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', groups: [:development, :test]
end

group :development do
  
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "pry-rails"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem "factory_bot_rails"
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "annotate"
