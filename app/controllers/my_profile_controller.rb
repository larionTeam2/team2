class MyProfileController < ApplicationController
  def index
  	@user = current_user.id
  	@myprofile = Profile.where(:user_id => @user)
  	@picture = Picture.where(:user_id => @user)
  end
end
