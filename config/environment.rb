RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')
Rails::Initializer.run do |config|
  config.gem 'haml'
  config.gem 'jrails'
  config.gem 'aasm'
end