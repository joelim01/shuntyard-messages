module ApiExceptions
  class MessageError < ApiExceptions::BaseException
    class MissingBody < ApiExceptions::PurchaseError
    end
  end
end
