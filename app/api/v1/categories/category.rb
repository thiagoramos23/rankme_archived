require './app/api/v1/categories/entities/category_request_entity'
require './app/api/v1/categories/entities/category_response_entity'
require './app/domain/category/use_cases/create'

module Api
  module V1
    module Categories
      class Category < Grape::API

        namespace :categories do
          desc 'Create Category',
          http_codes: [
            [201, 'Created']
          ],
          notes: <<-NOTE

            ----------------
              POST https://rankme.com/api/v1/categories
              {
                name: 'Music'
              }
          NOTE
          params do
            requires :name, type: String, desc: "Category Name"
          end
          post do
            category_request = ::Api::V1::Categories::Entities::CategoryRequestEntity.new(params)
            category = ::Domain::Category::UseCases::Create.new(request_object: category_request).call
            present category, with: ::Api::V1::Categories::Entities::CategoryResponseEntity
          end
        end
      end
    end
  end
end
