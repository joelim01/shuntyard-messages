module ApiExceptions
  class MessageError < ApiExceptions::BaseException
    class MissingSender < ApiExceptions::MessageError
    end
  end
end
