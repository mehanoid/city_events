class Event < ApplicationRecord
  belongs_to :city, required: true
  has_many :conversation_topics, class_name: 'Conversation::Topic'
  accepts_nested_attributes_for :conversation_topics

  validates :name, :starts_at, :ends_at, presence: true
end
