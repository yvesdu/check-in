class EmailReminderMailer < ApplicationMailer
    def reminder_email(user, team)
      @user = user
      @team = team
      @events =
        Event
        .where(
          team_id: @team.id,
          event_time: 24.hours.ago..Time.now
        )
        .includes(%i[user team])
        .order('event_time DESC')
      reply_to = "'Standup App' <standups.#{@user.id}@app.buildasaasappinrails.com>"
      make_bootstrap_mail(to: @user.email, subject: "#{team.name} Standup Reminder!", reply_to: reply_to)
    end
  end
  