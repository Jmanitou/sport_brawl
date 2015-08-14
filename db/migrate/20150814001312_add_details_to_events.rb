class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_description, :string
    add_column :events, :event_image, :string
  end
end
