class AddAttachmentWineImgToWines < ActiveRecord::Migration
  def self.up
    change_table :wines do |t|
      t.attachment :wine_img
    end
  end

  def self.down
    remove_attachment :wines, :wine_img
  end
end
