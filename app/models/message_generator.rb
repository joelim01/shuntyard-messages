class MessageGenerator
  include ActiveModel::Serialization
  validates_with MessageGeneratorValidator
  attr_reader :message, :user_id, :recipients, :body, :subject, :send_on

  def initialize(user_id:, recipients:, body:, subject:)
    @user_id = user_id
    @recipients = recipients
    @send_on = send_on
    @body = body
    @subject = subject
    @message = Message.create(sender: user_id, recipients: recipients, send_on: send_on, body: body, subject: subject) if valid?
  end
end
