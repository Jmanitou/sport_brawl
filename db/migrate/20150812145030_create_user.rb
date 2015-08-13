class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :email
      t.string :profile_pic
    end
  end

  def down
    drop_table :users
  end
end
