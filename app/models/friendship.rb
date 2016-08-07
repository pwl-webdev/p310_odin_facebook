class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'

	validates :friend_id, presence: true
	validates :user_id, presence: true
end
