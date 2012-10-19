Boxey
=====

Boxey provides the [] operator to ActiveRecord classes.

# Documentation

Add this line to your Gemfile:

`gem "boxey", :git => "git://github.com/roguevalley/boxey.git"`

All ActiveRecord classes gain the [] method as an accessor.  By default, it fetches by the class's primary_key.

# Configuration

You may specify additional fields, presumably fields that validate uniqueness, by calling the boxey method.

    class User < ActiveRecord::Base
      boxey :id, :login, :email
      validates :login, uniqueness: true
      validates :email, uniqueness: true
    end

# Use

Given the configuration above:

`User[1] # returns the first User with an id (or login or email) of 1.

`User['me@example.com']` # returns the first User with an email (or id or login) of 'me@example.com'.

Returns nil if no match is found.