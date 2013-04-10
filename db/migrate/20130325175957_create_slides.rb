class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :caption
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
  end
end
