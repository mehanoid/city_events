class Conversation::Message < ApplicationRecord
  belongs_to :conversation_topic, required: true, class_name: 'Conversation::Topic'
  belongs_to :user, required: true

  validates :body, presence: true
end