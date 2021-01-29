class NewRegistrationService

    Result = ImmutableStruct.new(:success?, :user, :account, :error)
  
    def initialize(params)
      @user = params[:user]
      @account = params[:account]
      @plan = params[:plan]
    end
  
    def process_registration
      account_create
      stripe_create
      send_welcome_email
      notify_slack
      Result.new(success: true, user: user, account: account, error: nil)
    rescue ActiveRecord::RecordInvalid, Slack::Notifier => exception
      Result.new(
        success: false, user: user, account: account, error: exception.message
      )
    end
  
    private
  
    attr_reader :user, :account, :plan
  
    def account_create
      post_account_setup if account.save!
    end
  
    def post_account_setup
      user.account_id = account.id
      user.save!
      user.add_role :admin, account
    end
  
    def send_welcome_email
      WelcomeEmailMailer.welcome_email(user).deliver_later
    end
  
    def notify_slack
      SlackNotificationJob.perform_later(user)
    end
  end