class StandupsMailbox < ApplicationMailbox
  TASK_TYPE_HASH = {
    '[d]' => 'Did',
    '[t]' => 'Todo',
    '[b]' => 'Blocker'
  }

  def process
    # Get a user id from reply-to or bail
    reply_user = mail.to.first&.split('<')&.last&.split('@')&.first&.split('.')&.last
    return if reply_user.blank?

    # Find a user by the id or bail
    user = User.find_by(id: reply_user)
    return if user.nil?

    # Bail if standup with incoming message-id exists
    return if Standup.exists?(message_id: inbound_email.message_id)

    # Bail if a standup for today exists
    today = Date.today.iso8601
    return if Standup.exists?(standup_date: today)

    # Get content or bail
    safe_body = Rails::Html::WhiteListSanitizer.new.sanitize(mail_body)
    tasks_from_body = safe_body.scan(/(\[[dtb]{1}\].*)$/)
    return if tasks_from_body.blank? || tasks_from_body.empty?

    build_and_create_standup(
      user: user,
      tasks: tasks_from_body,
      date: today,
      message_id: inbound_email.message_id
    )
  end

  private

  def build_and_create_standup(user:, tasks:, date:, message_id:)
    standup = Standup.new(
      user_id: user.id,
      standup_date: date,
      message_id: message_id
    )

    tasks.each do |task|
      task_type, task_body = task.first.scan(/(\[[dtb]\])(.*)$/).flatten
      standup.tasks << Task.new(type: TASK_TYPE_HASH[task_type], title: task_body)
    end

    standup.save
  end

  def mail_body
    @mail_body ||= begin
      body = if mail.multipart?
        mail.parts[0].body.decoded
      else
        mail.decoded
      end
      body.split('##- Please type your reply above this line -##').first
    end
  end
end
