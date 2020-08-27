class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :view_party, foreign_key: true
      t.integer :attendee_id

      t.timestamps
    end
  end
end
