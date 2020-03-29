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

      class Lim

        class Zero < ArgumentError

          MESSAGE = "Given argument shouldn't be 0."

          def initialize
            super(MESSAGE)
          end
        end

        class Negative < ArgumentError

          MESSAGE = "Given argument should be more than 0."

          def initialize
            super(MESSAGE)
          end
        end
      end

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
