class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true,
                    length: {minimum: 3, maximum: 50}
  validates :description, presence: true,
                          length: {minimum: 3, maximum: 30000}
  validates :user_id, presence: true

  #Mounts paperclip image
  # has_attached_file :image,
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end