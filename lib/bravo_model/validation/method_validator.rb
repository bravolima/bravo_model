class BravoModel::Validation::MethodValidator < ActiveModel::EachValidator

  def validate_each(record, attr, value)
    method_name = options[:name] || "validate_#{attr}"
    record.send method_name
  end

end
