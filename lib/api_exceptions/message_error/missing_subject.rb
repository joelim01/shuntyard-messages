module ApiExceptions
  class MessageError < ApiExceptions::BaseException
    class MissingSubject < ApiExceptions::MessageError
    end
  end
end
