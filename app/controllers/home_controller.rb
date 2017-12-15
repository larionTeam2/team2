class HomeController < ApplicationController
  def index
  	@picture = Picture.all
  end
end
