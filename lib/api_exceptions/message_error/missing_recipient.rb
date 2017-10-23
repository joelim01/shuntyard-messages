module ApiExceptions
  class MessageError < ApiExceptions::BaseException
    class MissingRecipient < ApiExceptions::PurchaseError
    end
  end
end
