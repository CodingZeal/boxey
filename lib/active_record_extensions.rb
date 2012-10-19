require 'active_record'

class ActiveRecordExtensions; end

class ActiveRecord::Base
  def self.[](identifier)
    boxey_field_names.each do |field_name|
      record = send(:"find_by_#{field_name}", identifier)
      return record if record
    end
    nil
  end

  def self.boxey(*field_names)
    @boxey_field_names = [primary_key]
    @boxey_field_names << field_names if field_names
    @boxey_field_names = @boxey_field_names.flatten.uniq.compact
  end

  def self.boxey_field_names
    ((@boxey_field_names || []) << primary_key).uniq.compact
  end
end
