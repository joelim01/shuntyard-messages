class User < ApplicationRecord
  has_secure_password
  has_many :sent_messages, :through => :messages_senders, :source => :message
  has_many :received_messages, :through => :messages_recipients, :source=> :message
  has_many :messages_senders
  has_many :messages_recipients
end
