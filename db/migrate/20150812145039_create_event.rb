class CreateEvent < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :event
      t.string :date
      t.string :skill_level
      t.string :location
      t.string :gender
      t.integer :number_of_people
    end
  end

  def down
    drop_table :events
  end
end
