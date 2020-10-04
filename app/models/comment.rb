class Comment < ApplicationRecord
  validates :host_id, presence: true
  validates :client_id, presence: true
  validates :text, length: { maximum: 300 }

  def sender
    User.find(self.client_id)
  end
end
