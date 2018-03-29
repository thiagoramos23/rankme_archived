module Domain
  module Repository

    def create(converter, entity)
      model = converter.to_model(entity)
      model.save! if model.id.nil?
      converter.to_entity(model)
    end
  end
end