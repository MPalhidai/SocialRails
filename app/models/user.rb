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

  validate :validate_age

  def users_notifications
    self.friend_requested.where(approve: false)
  end

  def users_friends #I can also change the output of this to the Users of the uniq IDs in these Friend tables. A SQL select query might be easier. select * from User where
    i_approved = "SELECT requesting_id FROM friends WHERE requested_id = :user_id AND approve = true"
		you_approved = "SELECT requested_id FROM friends WHERE requesting_id = :user_id AND approve = true"
		User.where("id IN (#{i_approved}) OR id IN (#{you_approved})", user_id: self.id)
  end

  def not_friends_yet
    User.where("id NOT IN (#{users_friends})")
  end

  private

  def validate_age
    if birthday.present? && birthday > 18.years.ago.to_date
      errors.add(:birthday, 'You must be over 18 years old.')
    end
  end
end
