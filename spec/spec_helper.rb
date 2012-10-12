require 'rubygems'
require 'bundler/setup'

require 'boxey'
require 'acts_as_fu'
require 'active_record'

RSpec.configure do |config|
  config.include ActsAsFu
end
