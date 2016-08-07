class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def index
		@users = User.where('id NOT IN (SELECT friend_id FROM friendships where user_id = ?)', current_user.id)
		@friends = current_user.friends.all
	end
end
