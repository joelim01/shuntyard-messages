class MessageGenerator
  include ActiveModel::Validations
  validates_with MessageGeneratorValidator
  attr_reader :message, :user_id, :recipients, :body, :subject, :send_on

  def initialize(user_id:, message_params:)
    @user_id = user_id
    @recipients = User.find_by(username: message_params[:recipients])
    @send_on =  message_params[:send_on]
    @body =  message_params[:body]
    @subject =  message_params[:subject]
    @message = Message.create(sender: user_id, recipients: recipients, send_on: send_on, body: body, subject: subject) if valid?
  end
end
