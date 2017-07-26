class AddFileLocationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :file_location, :string
  end
end
