require 'active_model'

module Domain
  class Validator
    include ActiveModel::Validations

    def self.new(*args, &block)
      instance  = allocate()
      entity    = args[0]
      variables = entity.instance_variables
      keys      = variables.join(', ').gsub('@', ':')
      instance.class.class_eval("attr_reader #{keys}")

      variables.each do |var|
        instance.instance_variable_set(var, entity.instance_variable_get(var))
      end

      instance.send(:initialize, &block)
      instance
    end
  end
end
