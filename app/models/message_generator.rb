class MessageGenerator
  include ActiveModel::Validations
  validates_with MessageGeneratorValidator
  attr_reader :message, :sender, :recipients, :body, :subject, :send_on

  def initialize(user_id: nil, message_params:)

    @sender = User.find_by(id: user_id)
    @recipients = User.find_by(username: message_params[:recipients])
    @send_on =  message_params[:send_on]
    @body =  message_params[:body]
    @subject =  message_params[:subject]
    binding.pry
    @message = Message.create(sender: @sender , recipients: [@recipients], send_on: @send_on, body: @body, subject: @subject) if valid?
  end
end
