class AddPhotoIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :photo_id, :integer
  end
end
