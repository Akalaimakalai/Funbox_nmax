module NMax
  class Application
    require_relative 'find_numbers_service'
    require_relative 'modules/errors'

    attr_reader :text, :limit

    def initialize(text, limit)
      @text = text
      validate_limit(limit)
      @limit = limit.to_i
    end

    def call
      @service = NMax::FindNumbersService.new
      response = @service.find_in(@text)
      puts response.sort.reverse[0..@limit]
    end

    private

    def validate_limit(limit)
      raise Errors::Str::InvalidClass unless limit.is_a?(String)
      raise Errors::Lim::Zero if limit.to_i.zero?
      raise Errors::Lim::Negative if limit.to_i.negative?
    end
  end
end
