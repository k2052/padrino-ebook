source "https://rubygems.org"

# Server requirements
gem "puma"

# Project requirements
gem 'rake'
gem 'padrino-flash'

# Component requirements
gem 'stripe'
gem 'imperator', '~> 0.2.0', :git => 'git://github.com/karmajunkie/imperator.git', :require => 'imperator'
gem "omniauth-github", :require => "omniauth-github"

## Output
gem 'slim'
gem 'oj',         :require => 'oj'
gem 'multi_json', :require => 'multi_json'
gem "kramdown",   :git => 'git://github.com/k2052/kramdown.git'

# DB           
gem 'tzinfo'
gem 'magic'
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'bson_ext',    :require => 'mongo'
gem 'mongo_mapper'

# Assets
gem 'sprockets' 
gem "sprockets-sass"
gem 'coffee-script'  
gem 'uglifier' 
gem 'padrino-pipeline'
gem 'padrino-responders',  :git => 'git://github.com/k2052/padrino-responders.git'

# css
gem "compass"
gem "sassy-buttons"
gem "zurb-foundation"
gem "susy"

# Remove during final production
group :production do
  gem 'ffaker',      '~> 1.15.0', :require => 'ffaker'
  gem 'factory_girl', '~> 4.1.0', :require => 'factory_girl'
end

# Development and Test Dependencies
group :development, :test do
  gem 'ffaker', '~> 1.15.0', :require => 'ffaker'
  gem 'factory_girl', '~> 4.1.0', :require => 'factory_girl'
end

# Test Requirements
group :test do
  gem 'rspec',        '~> 2.13.0'
  gem "mocha", '~> 0.13.3', :require => false
  gem 'rack-test', '~> 0.6.2', :require => 'rack/test'
  gem 'webmock', '~> 1.9.0'
end

# Padrino
gem 'padrino'
