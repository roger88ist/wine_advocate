class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.string :origin

      t.timestamps null: false
    end
  end
end
