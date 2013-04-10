class AddNametoUsersTable < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
  end

  def down
    removey_column :users, :name
  end
end
