module Api
  module V1
    class UsersController < ApplicationController
      before_filter: :set_user, only: [:update, :show, :edit]

      def show
      end

      def edit
      end

      def create
        user = User.new(user_params)
        user.save!
      end

      def update
      end

      def destroy
      end

      private

      def set_user
        @user = current_user
        if @user
      end

      def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password, :username)
      end

    end
  end
end
