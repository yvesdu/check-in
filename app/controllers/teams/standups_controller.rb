class Teams::StandupsController < ApplicationController
    
    def index
      set_teams_and_standups(current_date)
    end
  end
  