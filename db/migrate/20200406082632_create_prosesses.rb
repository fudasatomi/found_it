class CreateProsesses < ActiveRecord::Migration[5.2]
  def change
    create_table :prosesses do |t|
      t.integer :recipe_id
      t.string :image_id
      t.text :explanation

      t.timestamps
    end
  end
end
