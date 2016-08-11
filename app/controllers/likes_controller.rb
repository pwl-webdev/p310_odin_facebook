class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,   only: :destroy

	def create
		@like = current_user.liked_posts.build(like_params)
		if @like.save!
			flash[:success] = "Like created!"
		end
		redirect_to user_path(current_user)
	end
	def destroy
	end

	private
	def like_params
		params.permit(:post_id)
	end
	def correct_user
		@comment = current_user.like_posts.find_by(id: params[:id])
		redirect_to root_url if @comment.nil?
	end
end
