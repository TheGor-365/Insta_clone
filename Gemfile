source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'pg'
gem 'carrierwave', '~> 2.0'
# gem 'fog-aws'
gem 'mini_magick'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem "net-http"
gem "net-smtp"
gem "net-imap"
gem "uri"


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem "spring"
  gem 'spring-watcher-listen'
  gem "figaro"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
