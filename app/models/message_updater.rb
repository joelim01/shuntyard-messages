class MessageUpdater
  include ActiveModel::Serialization
  validates_with MessageGeneratorValidator
  attr_reader :id, :message, :sender, :recipients, :body, :subject, :send_on

  def initialize(user_id:, recipients:, body:, subject:)
    @sender = User.find_by(id: user_id)
    @recipients = User.find_by(username: message_params[:recipients])
    @send_on =  message_params[:send_on]
    @body =  message_params[:body]
    @subject =  message_params[:subject]
    @message = Message.update(recipients: [@recipients], send_on: @send_on, body: @body, subject: @subject) if valid?
  end
end
