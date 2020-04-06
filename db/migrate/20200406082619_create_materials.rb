class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.integer :recipe_id
      t.string :name
      t.string :image_id
      t.integer :quantity
      t.string :maker

      t.timestamps
    end
  end
end
