module NMax
  class FindNumbersService
    require_relative 'modules/errors'

    ASCII_CODE_0 = 48.freeze

    ASCII_CODE_9 = 57.freeze

    ASCII_CODES = (ASCII_CODE_0..ASCII_CODE_9).freeze

    def initialize
      @response = []
      reset
    end

    def find_in(text)
      loop do
        sign = text.getbyte
        numeral?(sign) ? add_sign(sign) : add_number
        break if sign.nil?
      end
      @response
    end

    private

    def add_sign(byte)
      validate_number_length
      @number.setbyte(@counter, byte)
      @counter += 1
    end

    def numeral?(byte)
      ASCII_CODES.include?(byte)
    end

    def add_number
      candidate = @number.delete(' ')
      return if candidate.empty?
      @response << candidate.to_i
      reset
    end

    def reset
      @number = String.new(' ' * 1000, encoding: Encoding::BINARY)
      @counter = 0
    end

    def validate_number_length
      raise Errors::Num::TooLongNumber if @counter >= 1000
    end
  end
end
