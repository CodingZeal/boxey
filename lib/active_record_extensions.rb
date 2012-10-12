require 'active_record'

class ActiveRecordExtensions; end

class ActiveRecord::Base
  def self.[](identifier)
    unique_identifiers.each do |field_name|
      record = send(:"find_by_#{field_name}", identifier)
      return record if record
    end
    nil
  end

  # Returns a list of attribute_names that should be unique
  def self.unique_identifiers
    (self::UNIQUE_IDENTIFIER_FIELD_NAMES rescue []) << primary_key
  end
end
