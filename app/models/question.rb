class Question < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :delete_all
  attachment :image
  attachment :answer_image

  validates :number, presence: true, uniqueness: true, numericality: {only_integer: true}
  validates :hint_1, length: { maximum: 50 }
  validates :hint_2, length: { maximum: 50 }
  validates :hint_3, length: { maximum: 50 }
  validates :answer, length: { maximum: 50 }, presence: true


  def commented_by?(user)
    ratings.where(user_id: user.id).exists?
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
