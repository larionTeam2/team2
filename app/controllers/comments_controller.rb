class CommentsController < ApplicationController
	def create
		@picture = Picture.find(params[:picture_id])

		@user = current_user.id
		@name = Profile.where(:user_id => @user)
		
		@comment = @picture.comments.create(comment_params) do |f|
			@name.each do|n|
				f.commenter = n.name
			end
		end

		redirect_to picture_path(@picture)
	end

	def destroy
		@picture = Picture.find(params[:picture_id])
		@comment = @picture.comments.find(params[:id])
		@comment.destroy
		redirect_to my_profile_index_url
	end
	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end

end
