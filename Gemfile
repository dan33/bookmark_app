source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.12'
gem 'foundation_rails_helper'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
  gem 'simple_form'
  gem 'devise'
  gem 'friendly_id'
  gem "will_paginate", "~> 3.0.4"
  gem 'metainspector'
  gem 'quiet_assets'
  gem 'thin'
end

gem 'rspec-rails', :group => [:development, :test]
gem 'simplecov', :group => [:development, :test]

group :production do
  gem 'pg', "~> 0.15.1"

  gem 'devise'
  gem 'thin'
  gem 'simple_form'
  gem 'friendly_id'
  gem "will_paginate", "~> 3.0.4"
  gem 'metainspector'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
  gem 'jquery-rails'
end
