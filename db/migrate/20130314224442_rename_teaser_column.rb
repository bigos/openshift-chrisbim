class RenameTeaserColumn < ActiveRecord::Migration
  def up
    rename_column :posts, :teazer, :teaser
  end

  def down
    rename_column :posts, :teaser, :teazer    
  end
end
