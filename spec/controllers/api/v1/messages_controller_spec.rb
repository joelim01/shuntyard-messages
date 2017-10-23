require 'rails_helper'
RSpec.describe Api::V1::MessagesController, :type => :request do

  let!(:user1)   { FactoryBot.create :user, username: 'user1' }
  let!(:user2)   { FactoryBot.create :user }
  let!(:message) { FactoryBot.create :message }
  let!(:today)   { Date.today }

    it "Takes valid params and returns the object in the response" do
      expect { post "/api/v1/users/#{user2.id}/messages?message[recipients]=#{user1.username}&message[subject]=#{message.subject}&message[body]=#{message.body}&message[send_on]=#{today}" }
      .to change { Message.count }.by 1
      parsed_body = JSON.parse(response.body)
      responses   = [{"id" => Message.last.id},
                     {"subject" => message.subject},
                     {"body" => message.body},
                     {"send_on" => today.strftime('%F')}]
      responses.each do |r|
        expect(parsed_body).to include(r)
      end
    end
    context "with bad recipient" do
      it "returns 200s on a bad request with error status and error message" do
        expect { post "/api/v1/users/#{user2.id}/messages?message[recipients]='nooneherebythatname'&message[subject]=#{message.subject}&message[body]=#{message.body}&message[send_on]=#{today}" }
        .to change { Message.count }.by 0
        parsed_body = JSON.parse(response.body)
        expect(response.status) == 200
        expect(parsed_body["status"]).to include("error")
        expect(parsed_body["message"]).to include("Message requires at least one recipient")
      end
    end
    context "with no subject" do
      it "returns 200s on a bad request with error status and error message" do
        expect { post "/api/v1/users/#{user2.id}/messages?message[recipients]=#{user1.username}&message[subject]=''&message[body]=#{message.body}&message[send_on]=#{today}" }
        .to change { Message.count }.by 0
        parsed_body = JSON.parse(response.body)
        expect(response.status) == 200
        expect(parsed_body["status"]).to include("error")
        expect(parsed_body["message"]).to include("Message requires a subject")
      end
    end
end
