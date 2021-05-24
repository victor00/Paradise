class CreateWeekPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :week_points do |t|
      t.datetime :week
      t.integer :points
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
