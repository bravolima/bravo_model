module BravoModel
  module Utils


  def debug
    raise "err" unless Rails.env.development?
    valid?; errors.full_messages
  end


  def full_errors(options={})
    arr = errors.full_messages
    arr.reject! { |x| x =~ options[:except] } if options.key?(:except)
    arr.select! { |x| x !~ options[:only] } if options.key?(:only)
    arr
  end


  end
end
