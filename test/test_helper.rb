require 'test/unit'
require 'mocha'

require 'active_record/observer'
require 'action_controller'

RAILS_ROOT = File.dirname(__FILE__)
RAILS_DEFAULT_LOGGER = Logger.new('/dev/null')

require File.dirname(__FILE__) + '/../lib/lazy_sweeper'
