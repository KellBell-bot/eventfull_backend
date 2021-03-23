class User < ApplicationRecord
    has_many :calendar_events
    has_many :events, through: :calendar_events

    has_secure_password
    validates :username, uniqueness: true
end
