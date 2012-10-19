require 'active_record'

class ActiveRecordExtensions; end

class ActiveRecord::Base
  def self.[](identifier)
    query = [
      boxey_field_names.map do |field_name|
        "#{field_name} = ?"
      end.join(" OR ")
    ] + [identifier] * boxey_field_names.length
    where(query).first
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
