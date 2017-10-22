class Message < ApplicationRecord
  include ActiveModel::Serializers::JSON
  has_one :messages_sender, :dependent => :destroy
  has_one :sender, :class_name => "User", through: :messages_sender, source: :user
  has_many :messages_recipients, :dependent => :destroy
  has_many :recipients, :class_name => "User", through: :message_recipients, source: :user
  accepts_nested_attributes_for :messages_recipients
end
