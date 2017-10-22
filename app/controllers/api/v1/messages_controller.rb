module Api
  module V1
    class MessagesController < ApplicationController
      before_filter: :set_user, :set_messages

            def index
            end

            def show
            end

            def new
            end

            def edit
            end

            def create
            end

            def update
            end

            def destroy
            end

            private

            def set_user
              @user = current_user
            end

            def set_messages
              messages = { sent: @user.sent_messages, received: @user.received_messages, outbox: @user.sent_messages.where(delivered: false) }
            end

          end
        end
      end