class RenameParendIdColumnToCategories < ActiveRecord::Migration[5.2]
  def change
  	rename_column :categories, :parent_id, :parent_category_id
  end
end
