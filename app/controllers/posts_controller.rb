class PostsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post created!"
		end
		redirect_to user_path(current_user)
	end

	def destroy
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end
end