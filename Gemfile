source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'

gem 'react-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in productio
gem 'redis', '~> 4.0'

gem 'bootstrap', '~> 4.2.1'

gem 'local_time'

gem 'devise'

gem 'devise_invitable'

gem 'rolify'

gem 'cancancan'

gem 'immutable-struct'

gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sinatra', require: nil

gem 'gravatar_image_tag'

gem 'money-rails'

gem 'slack-notifier'

gem 'bootstrap-email'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'cocoon'

gem 'rack-mini-profiler'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', :github => 'rspec/rspec-rails', :branch => '4-0-maintenance'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'simplecov', :require => false, :group => :test
  gem "factory_bot_rails"
  gem 'webdrivers', '~> 4'
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "letter_opener"
  gem 'foreman'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'rack-cors', :require => 'rack/cors'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
