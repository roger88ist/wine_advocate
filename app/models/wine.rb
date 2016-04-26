class Wine < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :wine_img, styles: { wine_index: "250x350>", wine_show: "325x475>" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :wine_img, content_type: /\Aimage\/.*\Z/
end
