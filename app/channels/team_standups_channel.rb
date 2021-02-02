class TeamStandupsChannel < ApplicationCable::Channel
    def subscribed
      date = Base64.urlsafe_encode64 params[:date], padding: false
      stream_from "team:#{params[:team_id]}:standups:#{date}"
    end
  
    def unsubscribed
      stop_all_streams
    end
  end
  