class RenameWorkshopTypeColumnToDuration < ActiveRecord::Migration
  def up
    rename_column :workshops, :type, :duration
  end

  def down
    rename_column :workshops, :duration, :type
  end
end
