class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :user_id

      t.timestamps
    end
  end
end
