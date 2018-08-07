class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_profile

  has_one :profile, dependent: :destroy
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :friend_requesting, class_name: :Friend, foreign_key: :requesting_id, dependent: :destroy
  has_many :friend_requested, class_name: :Friend, foreign_key: :requested_id, dependent: :destroy

  validates :first_name, :last_name, :email, :birthday, presence: true


end
