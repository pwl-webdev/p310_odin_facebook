class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@posts = Post.where('user_id IN (SELECT friend_id FROM friendships where user_id = ?) OR user_id = ?', current_user.id, current_user.id)
		@post = current_user.posts.build
	end
	def index
		@users = User.where('id NOT IN (SELECT friend_id FROM friendships where user_id = ?) AND id != ?', current_user.id, current_user.id)
		@friends = current_user.friends.all
		@requested_friends = current_user.requested_friends.all 
		@pending_friends = current_user.pending_friends.all
	end
end
