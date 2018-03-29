require './app/api/v1/categories/root'

module Api
  module V1
    class Root < ::Grape::API
      version 'v1', using: :path
      format :json

      mount ::Api::V1::Categories::Root
    end
  end
end
