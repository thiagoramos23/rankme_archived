require './app/infrastructure/converters/category_converter'
require './app/domain/repository'
require './app/domain/exceptions/not_null'
require './app/domain/category/validators/category_validator'

module Domain
  module Category
    module Repositories
      class Create
        include ::Domain::Repository

        def initialize(category:)
          @category = category
        end

        def call
          validate_category
          create(converter, @category)
        end

        private
        def validate_category
          raise ::Domain::Exceptions::NotNull.new("Name needs to be informed") unless category_validator.valid?
        end

        def converter
          ::Infrastructure::Converters::CategoryConverter
        end

        def category_validator
          ::Domain::Category::Validators::CategoryValidator.new(@category)
        end

      end
    end
  end
end
