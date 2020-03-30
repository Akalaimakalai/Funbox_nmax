module NMax
  class Application
    require_relative 'find_numbers_service'
    require_relative 'modules/errors/lim_errors'
    require_relative 'modules/errors/str_errors'
    require_relative 'modules/errors/io_errors'

    def initialize(text, limit)
      validate_text(text)
      validate_limit(limit)

      @text = text
      @limit = limit.to_i
    end

    def call
      @service = NMax::FindNumbersService.new
      response = @service.find_in(@text)
      puts response.sort.reverse[0...@limit]
    end

    private

    def validate_limit(limit)
      raise Errors::Str::InvalidClass unless limit.is_a?(String)
      raise Errors::Lim::Zero if limit.to_i.zero?
      raise Errors::Lim::Negative if limit.to_i.negative?
    end

    def validate_text(text)
      raise Errors::IO::InvalidClass unless text.is_a?(IO)
    end
  end
end
