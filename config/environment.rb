require File.join(File.dirname(__FILE__), 'boot')


RAILS_GEM_VERSION = '2.3.11' unless defined? RAILS_GEM_VERSION

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.gem 'declarative_authorization', :source => 'http://gemcutter.org'
  config.gem 'searchlogic'
  config.gem 'prawn', :version=> '0.6.3'
  config.gem 'fastercsv', :version=> '1.5.4'
  config.gem 'number_to_words'
  config.gem 'will_paginate', :version => '2.3.12'

  config.autoload_once_paths += %W( #{RAILS_ROOT}/lib )
  config.autoload_paths += Dir["#{RAILS_ROOT}/app/models/*"].find_all { |f| File.stat(f).directory? }
  
  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  config.i18n.default_locale = :es
end
