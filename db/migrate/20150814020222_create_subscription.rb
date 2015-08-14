class CreateSubscription < ActiveRecord::Migration
  def up
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :event_id      
    end
  end

  def downrake
    drop_table :subsciptions
  end
end
