class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: "Event", foreign_key: :creator_id, dependent: :destroy
  # You should only have to make a dependence here on the through table for destruction purposes
  has_many :event_attendance, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendance, source: :event
  
  validates :username, presence: true, length: { in: 2..24 }
  validates_associated :created_events
end
