class ChangeQuentityToRecipes < ActiveRecord::Migration[5.2]
  def up
  	change_column :materials, :quantity, :string
  end

  def down
  	change_column :materials, :quantity, :integer
  end
end
