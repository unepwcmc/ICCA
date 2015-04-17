source 'https://rubygems.org'

# probably fixes  ArgumentError (invalid byte sequence in US-ASCII) globally
if RUBY_VERSION =~ /1.9/ # assuming you're running Ruby ~1.9
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

gem "rails", '2.3.18'
gem "pg"
gem "formtastic"
gem "authlogic"
gem "paperclip"
gem "aws-s3"
gem "cancan"
gem "rake"
gem "ya2yaml"

group :development do
  gem "taps", "~> 0.3.22"
  gem "heroku" # possibly obsolete?
  gem 'capistrano', '~> 2.15.5'
  gem 'capistrano-ext'
  gem 'rvm-capistrano', :require => false
  gem 'brightbox', '~> 2.4.4'
  gem "sqlite3-ruby", "1.3.2"
  gem "debugger"
end
