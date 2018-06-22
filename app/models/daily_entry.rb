class DailyEntry < ApplicationRecord
  scope :owned_by_user, ->(user_id) { where user_id: user_id }
  belongs_to :user

  validates :user_id, presence: true
  validates :body, presence: true
end
