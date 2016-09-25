class Notification < ApplicationRecord
  belongs_to :user, required: true

  scope :unread, -> { where(read: false) }
end
