class ViewImageController < ApplicationController
  def index
  	@current_user = current_user.id
  	@picture =  Picture.all
  	@user = User.all
  end
end
