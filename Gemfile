source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "httparty", "~> 0.21.0"
gem "jbuilder"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.1"
gem "resque", "~> 2.4"
gem "rswag-api"
gem "rswag-ui"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "whenever", "~> 1.0", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "sqlite3", "~> 1.4"
end

group :test do
  gem "factory_bot_rails", "~> 6.2"
  gem "rspec-rails", "~> 6.0"
  gem "rswag-specs"
end

group :production do
  gem "pg"
end
