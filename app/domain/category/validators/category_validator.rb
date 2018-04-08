require './app/domain/validator'

module Domain
  module Category
    module Validators
      class CategoryValidator < ::Domain::Validator
        validates :name, presence: true
      end
    end
  end
end
