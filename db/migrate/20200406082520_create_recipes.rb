class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :outline
      t.string :image_id
      t.integer :category_id
      t.boolean :is_closed

      t.timestamps
    end
  end
end
