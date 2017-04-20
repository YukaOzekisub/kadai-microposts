class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, class_name: 'Favorite', foreign_key: 'favorite_micropost_id'
  has_many :favorite_users, through: :favorites, source: :favorite_user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
