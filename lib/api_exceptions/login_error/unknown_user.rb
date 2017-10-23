module ApiExceptions
  class LoginError < ApiExceptions::BaseException
    class UnknownUser < ApiExceptions::PurchaseError
    end
  end
end
