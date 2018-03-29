require 'active_record'

module Infrastructure
  module Models
    class Category < ActiveRecord::Base
      self.table_name = 'categories'
    end
  end
end