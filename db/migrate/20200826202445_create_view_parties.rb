class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.integer :duration
      t.integer :movie_id
      t.references :user, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
