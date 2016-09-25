class Event < ApplicationRecord
  belongs_to :city, required: true

  validates :name, presence: true
end
