source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "httparty", "~> 0.21.0"
gem "jbuilder"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.1"
gem "rufus-scheduler", "~> 3.8"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "sqlite3", "~> 1.4"
end

group :production do
  gem "pg"
end
