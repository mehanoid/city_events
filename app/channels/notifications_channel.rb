# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  class << self
    def update_notifications_for(user)
      broadcast_to user, html: (rendered_notifications_for(user))
    end

    private

    def rendered_notifications_for(user)
      ApplicationController.render template: 'shared/_notifications', locals: {user: user}, layout: false
    end
  end
end
