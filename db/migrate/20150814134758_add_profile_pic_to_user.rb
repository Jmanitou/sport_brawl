class AddProfilePicToUser < ActiveRecord::Migration
  def change
    add_column :user, :profile_pic, :string
  end
end
