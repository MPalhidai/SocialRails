class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  after_create :create_profile

  has_one :profile, dependent: :destroy
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :friend_requesting, class_name: :Friend, foreign_key: :requesting_id, dependent: :destroy
  has_many :friend_requested, class_name: :Friend, foreign_key: :requested_id, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true #, :birthday
  #validate :validate_age

  def users_notifications
    self.friend_requested.where(approve: false)
  end

  def users_friends
    i_approved = "SELECT requesting_id FROM friends WHERE requested_id = :user_id AND approve = true"
		you_approved = "SELECT requested_id FROM friends WHERE requesting_id = :user_id AND approve = true"
		User.where("id IN (#{i_approved}) OR id IN (#{you_approved})", user_id: self.id)
  end

  def network_posts
    i_approved = "SELECT requesting_id FROM friends WHERE requested_id = :user_id AND approve = true"
		you_approved = "SELECT requested_id FROM friends WHERE requesting_id = :user_id AND approve = true"
    Post.where("user_id IN (#{i_approved}) OR user_id IN (#{you_approved}) OR user_id = :user_id", user_id: self.id)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split[0]
      user.last_name = auth.info.name.split[1]
      # user.profile.gender = auth.extra.raw_info.gender
      # user.profile.location = auth.info.location[name]
      # user.profile.avatar = auth.info.image
      # user.birthday = auth.info.birthday
      # user.image = auth.info.image # figure out how to get image to profile :avatar
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def validate_age
    if birthday.present? && birthday > 18.years.ago.to_date
      errors.add(:birthday, 'You must be over 18 years old.')
    end
  end
end
