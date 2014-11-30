source  "https://rubygems.org"
ruby    "2.1.5"

gem "rails", "4.2.0.beta4"

group :production do
  gem "uglifier",       ">= 1.3.0"
  gem "unicorn",        "~> 4.8.3"
  gem "rails_12factor", "~> 0.0.3"
end

gem "omniauth-redbooth",  "~> 0.0.2"
gem "redbooth-ruby",      "~> 0.0.5"

group :development, :test do
  gem "rspec-rails",  "~> 3.1.0"
  gem "capybara",     "~> 2.4.4"
  gem "guard-rspec",  "~> 4.3.1"
end

group :test do
  gem "webmock", "~> 1.20.4"
end

