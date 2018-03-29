module Api
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        before do
          header['Access-Control-Allow-Origin'] = '*'
          header['Access-Control-Request-Method'] = '*'
        end
      end
    end
  end
end

