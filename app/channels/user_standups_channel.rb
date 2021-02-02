class UserStandupsChannel < ApplicationCable::Channel
    def subscribed
      user = User.find(params[:user_id])
      stream_for user
    end
  
    def unsubscribed
      stop_all_streams
    end
  end
  