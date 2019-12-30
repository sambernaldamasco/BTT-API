class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
