module Api
  module V1
    class MessagesController < ApplicationController
      before_action :set_user, :set_messages

            def index
              render json: @messages
            end

            def show
              render json: @message
            end

            def edit
              render json: @message
            end

            def create
              message_generator = MessageGenerator.new(user_id: 1, message_params: message_params)
              render json: message_generator.message
            end

            def update
              message_updater = MessageUpdater.new(id: @message.id, user_id: @user.id, message_params: message_params)
              render json: message_generator.message
            end

            def destroy
            end

            private

            def set_user
              @user = current_user
            end

            def set_messages
              if params[:id]
                @message  = Message.find(params[:id])
              elsif @user.present?
                @messages = { sent: @user.sent_messages, received: @user.received_messages, outbox: @user.sent_messages.where(delivered: false) }
              else
                []
              end
            end

            def message_params
              params.require(:message).permit(:recipients, :subject, :body, :send_on)
            end

          end
        end
      end
