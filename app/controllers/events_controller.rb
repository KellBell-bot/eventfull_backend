class EventsController < ApplicationController

    def index 
        # user_id => from jwt
        events= User.find(user).events
        render json: events
    end

    def create
        event= Event.create(event_params)
          render json: event
    end


    private

    def event_params
        params.require(:event).permit(:title, :link, :date, :fee)
    end
end
