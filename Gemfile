source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


#gem 'sqlite3'
gem 'mysql2'
gem 'thin'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '= 3.1.1.0'
  gem 'kaminari'
  gem 'jquery-fileupload-rails'


  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end
gem 'jbuilder'

gem "rmagick"
gem "paperclip", "~> 4.2"
gem 'cancan'
gem 'pry'

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'simple-private-messages', '0.0.0', :git => 'git://github.com/jongilbraith/simple-private-messages.git'

gem 'dragonfly'
gem 'dragonfly-s3_data_store'

group :production do
  gem 'rack-cache', :require => 'rack/cache'
end

gem 'remotipart', '~> 1.2'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
  gem "bcrypt-ruby", :require => "bcrypt"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :test, :development do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem 'quiet_assets'

end


group :test do
  gem 'simplecov'
  gem 'database_cleaner'
end
