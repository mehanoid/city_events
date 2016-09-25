class EventsSearch < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :user, required: true

  # if search query contains no conditions
  def empty?
    city.blank? && user.blank? && name.blank? && from_date.blank? && to_date.blank?
  end
end
