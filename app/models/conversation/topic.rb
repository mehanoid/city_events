class Conversation::Topic < ApplicationRecord
  belongs_to :event
  has_many :conversation_messages, -> { order(created_at: :desc) },
           class_name: 'Conversation::Message', foreign_key: :conversation_topic_id, dependent: :destroy

  validates :title, presence: true
end