require './app/domain/category/repositories/create'

module Domain
  module Category
    module Services
      class Create

        def initialize(category:)
          @category = category
        end

        def call
          ::Domain::Category::Repositories::Create.new(category: @category).call
        end
      end
    end
  end
end