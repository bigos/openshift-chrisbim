class AddColumsForUserAuthentication < ActiveRecord::Migration
  def change
    add_column :users, :login, :string, :null => false
    add_column :users, :crypted_password, :string, :null => false
    add_column :users, :password_salt, :string, :null => false
    add_column :users, :persistence_token, :string, :null => false
    add_column :users,  :perishable_token, :string, :null => false
    add_column :users, :login_count, :integer, :default => 0, :null => false
    add_column :users, :failed_login_count, :integer, :default => 0, :null => false
    add_column :users, :last_request_at, :datetime
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_ip, :string
    add_column :users, :current_login_ip, :string
  end
end
