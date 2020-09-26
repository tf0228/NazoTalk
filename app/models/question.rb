class Question < ApplicationRecord
  belongs_to :user
  attachment :image
  attachment :answer_image
end
