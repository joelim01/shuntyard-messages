module ApiExceptions
  class BaseException < StandardError
    include ActiveModel::Serialization
    attr_reader :status, :code, :message

    ERROR_DESCRIPTION = Proc.new {|code, message| {status: "error | failure", code: code, message: message}}
    ERROR_CODE_MAP = {
      "MessageError::MissingSubject" =>
        ERROR_DESCRIPTION.call(400, "Message requires a subject"),
      "MessageError::MissingBody" =>
        ERROR_DESCRIPTION.call(400, "Message requires a body"),
      "MessageError::MissingRecipient" =>
        ERROR_DESCRIPTION.call(400, "Message requires at least one recipient"),
      "MessageError::MissingSender" =>
        ERROR_DESCRIPTION.call(400, "Message requires at least one sender")
    }

    def initialize
      error_type = self.class.name.scan(/ApiExceptions::(.*)/).flatten.first
      ApiExceptions::BaseException::ERROR_CODE_MAP
        .fetch(error_type, {}).each do |attr, value|
          instance_variable_set("@#{attr}".to_sym, value)
      end
    end
  end
end
