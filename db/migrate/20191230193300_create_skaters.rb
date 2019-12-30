class CreateSkaters < ActiveRecord::Migration[5.1]
  def change
    create_table :skaters do |t|
      t.string :name
      t.boolean :accepted, default: false
      t.boolean :veteran, default: false
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
