class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.integer :lateral_movement, default: 1
      t.integer :hockey_stop, default: 1
      t.integer :plow_stop, default: 1
      t.integer :turning_toe, default: 1
      t.integer :power_slide, default: 1
      t.integer :transitions, default: 1
      t.integer :backwards_skating, default: 1
      t.integer :speed_endurance, default: 1
      t.integer :recovery, default: 1
      t.integer :pack_work, default: 1
      t.integer :strategy_adaptability, default: 1
      t.integer :awareness_communication, default: 1
      t.integer :mental_recovery, default: 1
      t.references :skater, foreign_key: true

      t.timestamps
    end
  end
end
