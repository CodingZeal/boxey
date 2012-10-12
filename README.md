Boxey
=====

Boxey provides the [] operator to ActiveRecord classes.

# Documentation

Add this line to your Gemfile:

`gem "boxey", :git => "git://github.com/roguevalley/boxey.git"`

By default it accepts the class's primary_key as an argument.

You may add additional fields, presumably fields that validate uniqueness, by defining the following constant in the class:

`UNIQUE_IDENTIFIER_FIELD_NAMES = [:id, :email_address]`

# Examples of Use

`User[1]`

`User['me@example.com']`
