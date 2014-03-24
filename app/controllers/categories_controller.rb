class CategoriesController < ApplicationController

 def index
	@categories = Category.where(parent_id: nil)
 end

 def create
	@category = Category.new(params[:category])
    if @category.save
	  flash[:success] = "Category successfully created!"
      redirect_to categories_path
    else
	  self.new
      render 'new'
    end
 end
 
 def new
    @persons = User.all.map { |user| [user.name, user.id] }
	@parcategories = Category.all.map { |cat| [cat.title, cat.id] }
    @category = Category.new
 end
  
end
