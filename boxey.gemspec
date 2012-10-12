Gem::Specification.new do |s|
  s.name        = 'boxey'
  s.version     = '0.0.2'
  s.date        = '2012-10-11'
  s.summary     = "Boxey provides element reference (the [] operator) to ActiveRecord classes."
  s.description = "Boxey provides element reference (the [] operator) to ActiveRecord classes."
  s.authors     = ["Rob Head", "Ryan Spore"]
  s.email       = 'robert.head@gmail.com'
  s.files       = ["lib/boxey.rb"]

  s.add_dependency 'activerecord'
  s.add_development_dependency "rspec"
  s.add_development_dependency "acts_as_fu"
end