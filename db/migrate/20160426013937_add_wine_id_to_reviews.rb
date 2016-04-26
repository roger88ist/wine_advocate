class AddWineIdToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :wine_id, :integer
  end
end
