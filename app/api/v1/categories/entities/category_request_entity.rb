require './app/domain/category/entities/category_entity'

module Api
  module V1
    module Categories
      module Entities
        class CategoryRequestEntity

          def initialize(params)
            @name = params[:name]
          end

          def to_domain
            ::Domain::Category::Entities::CategoryEntity.new(name: @name)
          end
        end
      end
    end
  end
end
