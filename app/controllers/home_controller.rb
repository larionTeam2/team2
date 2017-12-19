class HomeController < ApplicationController
  def index    
    @picture = Picture.all    
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
