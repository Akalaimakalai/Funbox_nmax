module NMax
  module IOValidate
    require_relative 'errors/io_errors'

    private

    def validate_io(io)
      raise Errors::IO::InvalidClass unless io.is_a?(IO)
    end
  end
end
