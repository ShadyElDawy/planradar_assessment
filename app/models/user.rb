class User < ApplicationRecord
    has_many :tickets, foreign_key: :assigned_user_id

    validates :name, presence: true
    validates :due_date_reminder_time, presence: true
    validates :mail, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :due_date_reminder_interval, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    def user_zone
        DateTime.now.in_time_zone(time_zone).zone
    end
end
