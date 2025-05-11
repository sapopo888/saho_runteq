class Photo < ApplicationRecord
  belongs_to :user
  validates :comment, length: { maximum: 65_535 }
  mount_uploaders :images, ImageUploader
  has_many :album_photos
  has_many :albums, through: :album_photos
end
