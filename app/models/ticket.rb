class Ticket < ApplicationRecord
    belongs_to :assigned_user, class_name: 'User'
    has_many :scheduled_jobs, dependent: :destroy

    validates :title, :due_date, :status_id, :progress, presence: true
    validates :progress, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true }
    after_commit :notify_assigned_user, if: :send_due_date_reminder?, on: [:create, :update]
    before_destroy :cancel_scheduled_jobs, prepend: true
    before_update :cancel_scheduled_jobs
    def send_due_date_reminder?
        #check if user wants to be notified
        assigned_user.send_due_date_reminder
    end

    def notify_assigned_user
        # can leave last argument empty if we need to send via all available notification methods, 
        #otherwise specify the method like notify(self, :email)
        Notification::Notifier.new.notify(self)
    end
    
    def cancel_scheduled_jobs
        ##considering that ticket may have multiple jobs in the future for different strategies
        scheduled_jobs.each do |scheduled_job|
          Sidekiq::Status.cancel scheduled_job.job_id if scheduled_job.present?
        end
    end

     def reminder_datetime
        reminder_time = assigned_user&.due_date_reminder_time || "00:00:00"
        specific_due_date_time = DateTime.new(
            due_date.year,
            due_date.month,
            due_date.day,
            reminder_time.hour,
            reminder_time.min,
            reminder_time.sec,
            assigned_user.user_zone
            ) - assigned_user.due_date_reminder_interval.days
     end
end
