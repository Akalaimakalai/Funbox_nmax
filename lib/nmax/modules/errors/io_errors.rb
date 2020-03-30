module NMax
  module IOValidate
    module Errors
      class IO
        class InvalidClass < ArgumentError

          MESSAGE = "Given argument is not a IO class."

          def initialize
            super(MESSAGE)
          end
        end
      end
    end
  end
end
