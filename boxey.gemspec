Gem::Specification.new do |s|
  s.name        = "boxey"
  s.version     = "0.0.4"
  s.date        = "2012-10-19"
  s.authors     = ["Rob Head", "Ryan Spore"]
  s.email       = "robert.head@gmail.com"
  s.files       = ["lib/boxey.rb"]
  s.homepage    = "http://github.com/roguevalley/boxey"
  s.summary     = "Provides the [] element reference operator to ActiveRecord classes."
  s.description = <<MARKDOWN
Boxey provides the [] element reference operator to ActiveRecord classes.

# Installation

Add this line to your Gemfile:

`gem 'boxey'`

# Configuration

With the boxey gem installed, all ActiveRecord classes gain the [] method, which fetches by the class's primary_key by default.

You may specify additional fields, presumably fields that validate uniqueness, by calling the boxey method.

    class User < ActiveRecord::Base
      boxey :id, :login, :email
      validates :login, uniqueness: true
      validates :email, uniqueness: true
    end

# Use

Given the configuration above:

`User[1]` returns the first User with an id (or login or email) of `1`.

`User['me@example.com']` returns the first User with an email (or id or login) of `'me@example.com'`.

`[]` returns `nil` if no match is found.
MARKDOWN

  s.add_dependency "activerecord"
  s.add_development_dependency "rspec"
  s.add_development_dependency "acts_as_fu"
end
