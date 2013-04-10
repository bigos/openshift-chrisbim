class AddTeazerToPost < ActiveRecord::Migration
  def change
    add_column :posts, :teazer, :text
  end
end
