class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendees, through: :event_attendance, source: :attendee
    has_many :event_attendance, foreign_key: :event_id

    validates :title, :description, :date, :location, presence: true
    validates :title, length: { in: 4..24 }
    validates :location, length: { maximum: 128 }
end
