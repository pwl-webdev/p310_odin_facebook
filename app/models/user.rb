class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :friendships, :dependent => :destroy
  has_many :friends, -> { where(friendships: { status: "accepted"}) }, :through => :friendships
  has_many :requested_friends, -> { where(friendships: { status: "requested"}) },  :through => :friendships, :source => :friend
  has_many :pending_friends, -> { where(friendships: { status: "pending"}) }, :through =>:friendships, :source => :friend

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :liked_posts, :foreign_key => "user_id", :class_name => "Like"

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.email = auth.info.email
    	user.password = Devise.friendly_token[0,20]
    	user.confirmed_at = Time.zone.now
    	#user.name = auth.info.name   # assuming the user model has a name
    	#user.image = auth.info.image # assuming the user model has an image
  	end
  end

  #def self.new_with_session(params, session)
  #  super.tap do |user|
  #    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #      user.email = data["email"] if user.email.blank?
  #    end
  #  end
  #end
end
