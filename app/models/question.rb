class Question < ApplicationRecord
  belongs_to :user
  has_many :ratings
  attachment :image
  attachment :answer_image

  def commented_by?(user)
    ratings.where(user_id: user.id).exists?
  end
end
