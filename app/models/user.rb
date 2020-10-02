class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions
  has_many :favorites
  has_many :favorite_questions, through: :favorites, source: :question
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id"
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id"
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :ratings
  attachment :image
  enum rank: { bronze: 0, silver: 1, gold: 2, platinum: 3}

  def favorited_count
    questions.inject(0) { |sum, n| sum + n.favorites.count }
  end

  def average_rating
    total_ratings_value = questions.inject(0) { |sum, n| sum + n.ratings.sum(:value) }
    total_ratings_count = questions.inject(0) { |sum, n| sum + n.ratings.count }
    average_rating = (BigDecimal(total_ratings_value) / BigDecimal(total_ratings_count)).round(1).to_f
    if average_rating.nan?
      "まだ評価されていません"
    else
      average_rating
    end
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
