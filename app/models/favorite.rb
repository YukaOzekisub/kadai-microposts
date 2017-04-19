class Favorite < ApplicationRecord
  belongs_to :favorite_micropost, class_name: 'Micropost'
  belongs_to :favorite_user, class_name: 'User'
  
  validates :favorite_micropost_id, presence: true
  validates :favorite_user_id, presence: true
end
