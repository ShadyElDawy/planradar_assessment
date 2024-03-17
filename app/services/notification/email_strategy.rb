module Notification
  class EmailStrategy < BaseStrategy
    def notify(ticket)
      job = UserNotifyEmailJob.set(wait_until: ticket.reminder_datetime).perform_later(ticket)
      ScheduledJob.create(ticket: ticket, job_id: job.provider_job_id)
    end
  end
end
