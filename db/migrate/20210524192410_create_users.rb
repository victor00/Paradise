class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :discord_id
      t.integer :accumulated_points

      t.timestamps
    end
  end
end
