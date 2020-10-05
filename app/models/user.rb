class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(github)
  has_many :questions
  has_many :comments
  has_many :favorites
  has_many :favorite_questions, through: :favorites, source: :question
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id"
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id"
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :ratings
  attachment :image

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true
  validates :profile, length: { maximum: 250 }
  validates :rank, presence: true
  validates :is_active, inclusion: { in: [true, false] }

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

  def active_for_authentication?
    super && (self.is_active == true)
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(provider: auth.provider,
                      uid:      auth.uid,
                      name:     auth.info.name,
                      email:    User.dummy_email(auth),
                      password: Devise.friendly_token[0, 20]
      )
    end
    user.save
    user
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
