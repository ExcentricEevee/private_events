class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: ""
      t.string :description
      t.datetime :date, null: false
      t.string :location

      t.timestamps
    end

    add_index :events, :title, unique: true
  end
end
