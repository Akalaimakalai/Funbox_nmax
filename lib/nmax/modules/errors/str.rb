module NMax
  class Application

    module Errors

      class Str

        class InvalidClass < ArgumentError

          MESSAGE = "Given argument is not a String."

          def initialize
            super(MESSAGE)
          end
        end
      end
    end
  end
end
