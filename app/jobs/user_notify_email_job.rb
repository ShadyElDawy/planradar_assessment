class UserNotifyEmailJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    UserMailer.with(ticket: ticket).remind_due_date.deliver_now
  end
end
