class Photo < ApplicationRecord
  belongs_to :user
  validates :comment, length: { maximum: 65_535 }
end
