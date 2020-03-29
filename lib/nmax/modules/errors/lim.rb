module NMax
  class Application

    module Errors

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

    end
  end
end
