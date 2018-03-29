require './app/api/v1/categories/category'
require './app/api/v1/defaults'

module Api
  module V1
    module Categories
      class Root < Grape::API
        include V1::Defaults

        mount Category
      end
    end
  end
end
