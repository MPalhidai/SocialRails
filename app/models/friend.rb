class Friend < ApplicationRecord
  belongs_to :requesting, class_name: :User
  belongs_to :requested, class_name: :User

  validates :requesting_id, :requesting_id, presence: true
end
