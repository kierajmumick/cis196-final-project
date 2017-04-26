class LikesController < ApplicationController
	def new
		post = Post.find params[:post_id]
		if post.user_likes.include? current_user
			post.user_likes.delete current_user
		else
			post.user_likes.append current_user
		end
		redirect_to posts_path
	end
end
