require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    table_info = DB[:conn].execute("PRAGMA table_info(#{table_name})")
    column_names = table_info.collect {|info| info.name}.flatten
  end

  def initialize(options = {})
    self.column_names
  end
end