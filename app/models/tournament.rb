class Tournament < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :teams, dependent: :destroy
end
