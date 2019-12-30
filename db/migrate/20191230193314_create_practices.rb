class CreatePractices < ActiveRecord::Migration[5.1]
  def change
    create_table :practices do |t|
      t.string :date
      t.string :location
      t.boolean :has_happened
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
