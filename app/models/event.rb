class Event < ApplicationRecord
  belongs_to :city, required: true
  has_many :conversation_topics, class_name: 'Conversation::Topic', dependent: :destroy
  accepts_nested_attributes_for :conversation_topics

  validates :name, :starts_at, :ends_at, presence: true

  after_create :autosearch_notification

  private

  def autosearch_notification
    AutosearchNotification.new(self).notify!
  end
end
