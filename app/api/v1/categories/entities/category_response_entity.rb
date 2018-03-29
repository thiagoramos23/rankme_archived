require './app/api/v1/entity'

module Api
  module V1
    module Categories
      module Entities
        class CategoryResponseEntity < ::Api::V1::Entity

          expose :name, documentation: { type: "String", desc: "Category Name" }
        end
      end
    end
  end
end
