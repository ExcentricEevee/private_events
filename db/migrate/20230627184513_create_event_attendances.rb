class CreateEventAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.belongs_to :attendee
      t.belongs_to :event

      t.timestamps
    end
  end
end
