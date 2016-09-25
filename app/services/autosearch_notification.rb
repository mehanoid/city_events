class AutosearchNotification
  attr_accessor :event

  def initialize(event)
    self.event = event
    @event_searches_query = EventSearchesQuery.new(event)
  end

  def notify!
    users.each do |user|
      Notification.create user: user, message: %Q{New event "#{event.name}" matching your saved search}, url: url
      NotificationsChannel.update_notifications_for(user)
    end
  end

  private

  def users
    User.where id: @event_searches_query.search.select(:user_id).uniq
  end

  def url
    @url ||= Rails.application.routes.url_helpers.event_url(event)
  end

end