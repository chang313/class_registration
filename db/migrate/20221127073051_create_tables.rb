class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.integer :tutor_id, null: false
      t.datetime :start_time, null: false
      t.integer :active, null: false, default: 1
      t.integer :user_id, default: 0
      t.integer :duration, default: 0

      t.index [:tutor_id, :start_time], unique: true
    end
  end
end


