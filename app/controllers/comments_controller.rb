class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,   only: :destroy

	def new
		@comment = Comment.new
	end

	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save!
			flash[:success] = "Comment created!"
		end
		redirect_to user_path(current_user)
	end

	def destroy
		@comment.destroy
		flash[:success] = "Comment deleted!"
		redirect_to user_path(current_user)
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end
	def correct_user
		@comment = current_user.comments.find_by(id: params[:id])
		redirect_to root_url if @comment.nil?
	end
end
