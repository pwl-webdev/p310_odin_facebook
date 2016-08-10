class CommentsController < ApplicationController
	before_action :authenticate_user!
	def new
		@comment = Comment.new
	end

	def create
		@comment = current_user.comments.build(comment_params)
		#@comment = Comment.new(:user => current_user, :post_id => comment_params[:post_id], :content => comment_params[:content])
		if @comment.save!
			flash[:success] = "Comment created!"
		end
		redirect_to user_path(current_user)
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end
end
