class City < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :events_searches, dependent: :destroy

  validates :name, presence: true
end
