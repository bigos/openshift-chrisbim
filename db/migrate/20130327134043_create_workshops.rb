class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :type
      t.string :title
      t.string :teaser
      t.text :content

      t.timestamps
    end
  end
end
