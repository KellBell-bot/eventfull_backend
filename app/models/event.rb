class Event < ApplicationRecord
    has_many :calendar_events
    has_many :users, through: :calendar_events

end
