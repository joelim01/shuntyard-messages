module ApiExceptions
  class MessageError < ApiExceptions::BaseException
    class MisssingSubject < ApiExceptions::PurchaseError
    end
  end
end
