class MessageUpdater
  include ActiveModel::Serialization
  validates_with MessageGeneratorValidator
  attr_reader :id, :message, :user_id, :recipients, :body, :subject, :send_on

  def initialize(user_id:, recipients:, body:, subject:)
    @user_id = user_id
    @recipients = message_params[:recipients]
    @send_on =  message_params[:send_on]
    @body =  message_params[:body]
    @subject =  message_params[:subject]
    @message = Message.update(sender: user_id, recipients: recipients, send_on: send_on, body: body, subject: subject) if valid?
  end
end
