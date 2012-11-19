Boxey provides the [] element reference operator to ActiveRecord classes.

# Installation

Add this line to your Gemfile:

`gem 'boxey'`

# Configuration

With the boxey gem installed, all ActiveRecord classes gain the `[]` method.

By default, `[]` fetches by the class's `primary_key` and any other fields that are validated by uniqueness (unless the validation has `if` conditions).

Optionally, you may explicitly specify the fields to query by calling the `boxey` method.

    class User < ActiveRecord::Base
      boxey :id, :login, :email
      validates :login, uniqueness: true
      validates :email, uniqueness: true
    end

# Use

Given the configuration above:

`User[1]` returns the User with an id of `1`.

`User['me@example.com']` returns the User with an email of `'me@example.com'`.

`[]` returns `nil` if no match is found.
