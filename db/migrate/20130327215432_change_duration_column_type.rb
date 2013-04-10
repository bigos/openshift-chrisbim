class ChangeDurationColumnType < ActiveRecord::Migration
  def change
    change_column :workshops, :duration, :integer
  end
end
