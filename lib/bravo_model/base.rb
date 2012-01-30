# based on https://gist.github.com/1101257
class BravoModel::Base < ActiveRecord::Base
  self.abstract_class = true

  include BravoModel::Utils
  include BravoModel::Validation


  class_attribute :columns
  self.columns = []

   # changed columns() to a class_attribute so subclasses can inherit columns
  def self.column(name, sql_type = nil, default = nil, null = true)
    self.columns += [ActiveRecord::ConnectionAdapters::Column.new( name.to_s, default, sql_type.to_s, null )]
  end

  def self.columns_hash
    h = {}
    for c in self.columns
      h[c.name] = c
    end
    return h
  end

  def self.column_defaults
    Hash[self.columns.map{ |col|
      [col.name, col.default]
    }]
  end
    

  def self.descends_from_active_record?
    return true
  end
      

  # -- break --


  # nodoc
  def create
    run_callbacks :create do
      @new_record = false
      self.id = SecureRandom.uuid
    end
  end


  # nodoc
  def persisted?
    id.present?
  end


  # nodoc
  def update
    run_callbacks :update do
      true
    end
  end


end
