module ApiExceptions
  class MessageError < ApiExceptions::BaseException
    class MissingRecipient < ApiExceptions::MessageError
    end
  end
end
