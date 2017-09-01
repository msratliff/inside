class RemoveFbidFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :facebook_id, :string
  end
end
