class Comment < ApplicationRecord
  validates :host_id, presence: true
  validates :client_id, presence: true

  def sender
    User.find(self.client_id)
  end
end
