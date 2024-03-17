class UserMailer < ApplicationMailer
    def remind_due_date
        @ticket = params[:ticket]
        @user = @ticket.assigned_user

        mail(to: @user.mail, subject: 'Due Date Reminder')
    end

end
