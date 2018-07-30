class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :liked

  validates :content, :user_id, presence: true
end
