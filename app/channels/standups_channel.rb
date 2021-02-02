class StandupsChannel < ApplicationCable::Channel
    def subscribed
      standup = Standup.find(params[:standup_id])
      stream_for standup
      # stream_from "standups:#{params[:standup_id]}"
    end
  
    def unsubscribed
      stop_all_streams
    end
  end