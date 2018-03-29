require './app/infrastructure/converters/category_converter'
require './app/domain/repository'
require './app/domain/exceptions/not_null'

module Domain
  module Category
    module Repositories
      class Create
        include ::Domain::Repository

        def initialize(category:)
          @category = category
        end

        def call
          validate_category(@category)
          create(converter, @category)
        end

        private
        def validate_category(entity)
          raise ::Domain::Exceptions::NotNull.new("Name needs to be informed") if entity.name.nil? || entity.name.empty?
        end

        def converter
          ::Infrastructure::Converters::CategoryConverter
        end
      end
    end
  end
end