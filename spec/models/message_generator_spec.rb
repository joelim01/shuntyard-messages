RSpec.describe MessageGenerator do

  describe "creating a message" do
    let!(:user1)   { FactoryBot.create :user, username: 'user_1' }
    let!(:user2)   { FactoryBot.create :user }
    let!(:source_message) { FactoryBot.create :message }
    let!(:today)   { Date.today }

    context "without a body" do
      it "should not be allowed" do
        message_params = { recipients: [user2.username], subject: source_message.subject }
        expect { MessageGenerator.new(user_id: user1.id, message_params: message_params )}
        .to raise_error(ApiExceptions::MessageError::MissingBody)
      end
    end

    context "without a subject" do
      it "should not be allowed" do
        message_params = { recipients: [user2.username], body: source_message.body }
        expect { MessageGenerator.new(user_id: user1.id, message_params: message_params)}
        .to raise_error(ApiExceptions::MessageError::MissingSubject)
      end
    end

    context "without a sender" do
      it "should not be allowed" do
        message_params = { recipients: [user2.username], subject: source_message.subject, body: source_message.body  }
        expect { MessageGenerator.new( message_params: message_params )}
        .to raise_error(ApiExceptions::MessageError::MissingSender)
      end
    end

    context "without recipients" do
      it "should not be allowed" do
        expect { MessageGenerator.new(user_id: user1.id, message_params: { subject: source_message.subject, body: source_message.body  } )}
        .to raise_error(ApiExceptions::MessageError::MissingRecipient)
      end
    end

  end

end
