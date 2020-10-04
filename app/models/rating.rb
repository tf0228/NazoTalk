class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :comment, length: { maximum: 50 }
  validates :value, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }

  after_create :average_rating
  after_update :average_rating
  after_destroy :average_rating

  protected

    def average_rating
      if self.question.ratings.any?
        total_ratings = self.question.ratings.sum(:value)
        average_rating = (BigDecimal(total_ratings) / BigDecimal(self.question.ratings.count)).round(1).to_f
        self.question.update(average_rating: average_rating)
      else
        self.question.update(average_rating: 0.0)
      end
    end
end
