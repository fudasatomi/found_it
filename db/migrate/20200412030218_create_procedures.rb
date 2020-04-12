class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.integer :recipe_id
      t.string :image_id
      t.text :explanation

      t.timestamps
    end
  end
end
