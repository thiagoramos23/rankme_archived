module Api
  module V1
    class Entity < ::Grape::Entity
      format_with(:iso_timestamp, &:iso8601)
    end
  end
end

