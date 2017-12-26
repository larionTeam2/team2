class HomeController < ApplicationController
  def index
  	@picture = Picture.paginate(:page => params[:page], per_page: 8)  
		if current_user.present?
  		@user = current_user.id
  		@profile = Profile.where(:user_id => @user)
  		@profile.each do |f|
  			@username = f.name
  		end 
  	end
  end
   def search 
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
      #@results = Picture.all
    else  
      @parameter = params[:search].downcase  
      @results = Picture.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end  
  end 
end
