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
    @field_names = field_names
  end

  def self.boxey_field_names
    @boxey_field_names ||=
      if @field_names.present?
        [primary_key, @field_names].flatten.uniq.compact
      else
        default_boxey_field_names
      end
  end

  def self.default_boxey_field_names
    [
      primary_key,
      validators
        .select { |v| v.is_a?(ActiveRecord::Validations::UniquenessValidator) }
        .reject { |v| v.options.keys.include?(:if) }
        .map(&:attributes)
    ].flatten.uniq.compact
  end
end
