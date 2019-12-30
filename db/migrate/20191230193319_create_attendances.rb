class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :practice, foreign_key: true
      t.references :skater, foreign_key: true

      t.timestamps
    end
  end
end
