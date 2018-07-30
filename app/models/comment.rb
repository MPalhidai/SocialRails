class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :liked

  validates :content, :post_id, presence: true
end
