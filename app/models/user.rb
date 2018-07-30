class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :friend_requesting, class_name: :Friend, foreign_key: :requesting_id
  has_many :friend_requested, class_name: :Friend, foreign_key: :requested_id

  validates :first_name, :last_name, :email, :birthday, presence: true
end
