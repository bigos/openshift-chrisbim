class RemoveWorkshopTeaser < ActiveRecord::Migration
  def up
    remove_column :workshops, :teaser
  end

  def down
    add_column :workshops, :teaser, :string
  end
end
