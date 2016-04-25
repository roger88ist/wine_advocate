class AddCategoryIdToWines < ActiveRecord::Migration
  def change
    add_column :wines, :category_id, :integer
  end
end
