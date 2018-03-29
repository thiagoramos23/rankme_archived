require './app/infrastructure/models/category'
require './app/domain/category/entities/category_entity'

module Infrastructure
  module Converters
    class CategoryConverter

      def self.to_model(entity)
        category = find_or_new(entity)
        params = {
          id: entity.id,
          name: entity.name
        }
        category.attributes = params
        category
      end

      def self.to_entity(model)
        params = model.attributes.symbolize_keys
        ::Domain::Category::Entities::CategoryEntity.new(params)
      end

      private
      def self.find_or_new(entity)
        return ::Infrastructure::Models::Category.find(entity.id) if entity.id
        ::Infrastructure::Models::Category.new
      end
    end
  end
end