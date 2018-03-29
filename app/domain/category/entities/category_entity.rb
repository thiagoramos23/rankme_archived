module Domain
  module Category
    module Entities
      class CategoryEntity
        attr_accessor :id, :name

        def initialize(params)
          @id = params.fetch(:id, nil)
          @name = params.fetch(:name, nil)
        end
      end
    end
  end
end
