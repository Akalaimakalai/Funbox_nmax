module NMax
  class Application
    require_relative 'modules/errors'

    attr_reader :text, :number

    def initialize(text, number)
      @text = text
      validate_number(number)
      @number = number
    end

    def call
      puts @text.read
      puts @number
    end

    private

    def validate_number(number)
      raise Errors::Str::InvalidClass unless number.is_a?(String)
      raise Errors::Num::Zero if number.to_i.zero?
      raise Errors::Num::Negative if number.to_i.negative?
    end
  end
end
