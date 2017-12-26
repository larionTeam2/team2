class LikesController < ApplicationController
	def create
		@user = current_user.id
		@picture = Picture.find(params[:picture_id])
		@like = @picture.likes.create() do |f|
			f.liker = @user
		end

		redirect_to picture_path(@picture)
	end
	def destroy
		@picture = Picture.find(params[:picture_id])
		@like = @picture.likes.find(params[:id])
		@like.destroy
		redirect_to picture_path(@picture)
	end

	
end
