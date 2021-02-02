class SlackNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NotificationServices::SlackWebhooks::NewAccount
    .new(
      account: account,
      user: user
    )
    .send_message
  end
end