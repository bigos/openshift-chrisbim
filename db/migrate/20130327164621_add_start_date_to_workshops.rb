class AddStartDateToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :start_date, :date
  end
end
