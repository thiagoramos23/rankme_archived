module Domain
  module Exceptions
    class NotNull < ::StandardError

      def iniitalize(message)
        super(message)
      end
    end
  end
end