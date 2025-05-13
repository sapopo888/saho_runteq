class Photo < ApplicationRecord
  belongs_to :user
  has_many :album_photos, dependent: :destroy
  has_many :albums, through: :album_photos
  validates :comment, length: { maximum: 65_535 }
  mount_uploaders :images, ImageUploader
end
