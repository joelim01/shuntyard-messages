module ApiExceptions  
  class LoginError < ApiExceptions::BaseException
    class MalformedEmail < ApiExceptions::PurchaseError
    end
  end
end
