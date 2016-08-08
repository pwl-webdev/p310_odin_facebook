class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def index
		@users = User.where('id NOT IN (SELECT friend_id FROM friendships where user_id = ?) AND id != ?', current_user.id, current_user.id)
		@friends = current_user.friends.all
		@requested_friends = current_user.requested_friends.all 
		@pending_friends = current_user.pending_friends.all
	end
end
