module ApplicationHelper
  def read_notifications
    @notifications ||= begin
      notifications = current_user.notifications.unread
      notifications.update(read: true)
      notifications
    end
  end
end
