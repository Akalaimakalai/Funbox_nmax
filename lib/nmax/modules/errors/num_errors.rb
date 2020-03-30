module NMax
  class Application
    module Errors
      class Num
        class TooLongNumber < ArgumentError

          MESSAGE = "Number don't have to be longer than 1000 signs"

          def initialize
            super(MESSAGE)
          end
        end
      end
    end
  end
end
