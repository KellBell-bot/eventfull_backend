class CalendarEventsController < ApplicationController
    def index
        calendar_events= CalendarEvent.all
        render json: calendar_events
    end
end
