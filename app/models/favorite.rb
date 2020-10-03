class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :question

  after_create :rank_change
  after_destroy :rank_change

  protected

    def rank_change
      favorites_count = self.question.user.questions.inject(0) { |sum, n| sum += n.favorites.count }
      if favorites_count < 10
        self.question.user.update(rank: "bronze")
      elsif favorites_count >= 10
        self.question.user.update(rank: "silver")
      elsif favorites_count >= 50
        self.question.user.update(rank: "gold")
      elsif favorites_count >= 50
        self.question.user.update(rank: "platinum")
      end
    end
end
