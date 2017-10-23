module ApiExceptions
  class MessageError < ApiExceptions::BaseException
    class MissingBody < ApiExceptions::MessageError
    end
  end
end
