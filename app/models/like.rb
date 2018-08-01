class Like < ApplicationRecord
  belongs_to :liked, polymorphic: true
  belongs_to :user

  validates :liked_id, :liked_type, :user_id, presence: true
end
