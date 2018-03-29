require './app/domain/category/services/create'

module Domain
  module Category
    module UseCases
      class Create

        def initialize(request_object:)
          @request_object = request_object
        end

        def call
          ::Domain::Category::Services::Create.new(category: category).call
        end

        private
        def category
          @request_object.to_domain
        end
      end
    end
  end
end
