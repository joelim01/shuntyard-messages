class MessageGeneratorValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    validate_recipients
    validate_body
    validate_subject
  end

  def validate_subject
    raise ApiExceptions::MessageError::MissingSubject.new if @record.subject.blank?
  end

  def validate_recipients
    raise ApiExceptions::MessageError::MissingRecipient.new if @record.recipients.blank?
  end

  def validate_body
    raise ApiExceptions::MessageError::MissingBody.new if @record.body.blank?
  end
end
