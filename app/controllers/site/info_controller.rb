class Site::InfoController < ApplicationController
layout "site/index"

def index
	@categories = Category.all
end

def category
	@categories = Category.all
	@cat = Category.find_by_title_alias( params[:alias] )
end

end
