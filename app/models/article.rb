class Article < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :title, :body, :image, presence: true
end
