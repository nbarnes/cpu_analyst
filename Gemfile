source "https://rubygems.org"
ruby "2.0.0"

gem "rails", "4.0.3"

gem "pg"
gem "sass-rails", "~> 4.0.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "minitest-rails"
gem "turbolinks"
gem "jbuilder", "~> 1.2"
gem "coveralls", require: false
gem "haml"
gem "jquery-cookie-rails"
gem "jquery-colorbox-rails"
gem "redcarpet"

gem "figaro"

group :production do
  # For Heroku
  gem "rails_12factor"
end

group :test do
  gem "minitest-rails-capybara"
  gem "capybara-webkit"
  gem "turn"
  gem "simplecov"
end

group :development do
  gem "brakeman", :require => false
  gem "rails_best_practices"
end

group :development, :test do
  gem "pry-rails"
  gem "pry-debugger"
end
