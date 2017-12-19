class HomeController < ApplicationController
  def index
  	@picture = Picture.all
  	if current_user.present?
  		@user = current_user.id
  		@profile = Profile.where(:user_id => @user)
  		@profile.each do |f|
  			@username = f.name
  		end 
  	end

  end
end
