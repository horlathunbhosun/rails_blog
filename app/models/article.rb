class Article < ApplicationRecord
		validates :title, presence: true, 
				  length: {minimum: 3 , maximum:50}
		validates  :description, presence: true,
				   length: {minimum: 3, maximum:300}

		#Mounts paperclip image
		has_attached_file :image
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end