class Article < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :comentarios

  validates :title, :body, :image, presence: true
end
