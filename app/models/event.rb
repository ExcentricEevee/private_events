class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates :title, :description, :date, :location, presence: true
    validates :title, length: { in: 4..24 }
    validates :location, length: { maximum: 128 }
end
