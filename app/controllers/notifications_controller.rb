class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @notification = current_user.notifications.find(params[:id])
    @notification.update read: true
    NotificationsChannel.update_notifications_for(current_user)
    redirect_to @notification.url
  end
end