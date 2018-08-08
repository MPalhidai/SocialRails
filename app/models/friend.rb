class Friend < ApplicationRecord
  belongs_to :requesting, class_name: :User
  belongs_to :requested, class_name: :User
end
