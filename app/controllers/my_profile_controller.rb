class MyProfileController < ApplicationController
  def index
  	@user = current_user.id
  	@myprofile = Profile.where(:user_id => @user)
	@picture = Picture.where(:user_id => @user)
		
		#if @picture == nil
		#	respond_to do |format|
		#	format.html { redirect_to my_profile_index_url, notice: "You need to upload your image" }
		#	end
		#end
	end
end
