class Album < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  has_many :album_photos
  has_many :photos, through: :album_photos
end
