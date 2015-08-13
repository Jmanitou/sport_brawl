class AddSportToEvent < ActiveRecord::Migration
  def up
    add_column :events, :sport, :string
  end
  
  def down
    remove_column :events, :sport, :string
  end
end
