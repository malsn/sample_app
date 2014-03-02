class InfoController < ApplicationController

 def index
	@categories = Category.all
 end


end
