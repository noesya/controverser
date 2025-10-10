source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.7"

gem "bootsnap", require: false
gem "bootstrap"
gem "bootstrap-icons-helper"
gem "breadcrumbs_on_rails"
gem "curation"#, path: '../curation'
gem "editor_js"
gem "figaro"
gem "pg"
gem "puma"
gem "rails", "~> 8.0"
gem "rails-i18n"
gem "ruby-openai"
gem "sassc-rails"
gem "simple_form"
gem "sprockets-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "annotaterb"
  gem "web-console"
  gem "byebug"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
