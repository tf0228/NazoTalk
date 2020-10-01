class Question < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :delete_all
  attachment :image
  attachment :answer_image

  def commented_by?(user)
    ratings.where(user_id: user.id).exists?
  end

  def favorited_by?(user)
    Favorite.where(user_id: user.id).exists?
  end
end
