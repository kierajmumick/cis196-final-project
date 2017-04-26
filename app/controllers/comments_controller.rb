class CommentsController < ApplicationController

	def create
		@post = Post.find params[:post_id]
		@comment = Comment.create comment_params
		@comment.user = current_user
		@post.comments.append @comment
		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to posts_path
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

end
