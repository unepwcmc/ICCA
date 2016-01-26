source 'https://rubygems.org'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

gem "rails", '2.3.18'
gem "pg"
gem "formtastic"
gem "authlogic"
gem "paperclip"
gem "aws-sdk", '~> 2.2.13'
gem "cancan"
gem "rake"
gem "ya2yaml"
gem "iconv", '~> 1.0.4'

group :development do
  gem 'capistrano-rvm',   '~> 0.1', require: false
  gem 'capistrano', '~> 3.4.0', require: false
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-passenger', '~> 0.1.1', require: false
end

group :development, :test do
  gem "byebug"
end

group :test do
  gem 'mocha'
  gem 'test-unit'
end
