class CategoriesController < ApplicationController

 def index
	#@categories = Category.where(parent_id: nil).paginate(page: params[:page])
	@categories = current_user.categories.paginate(page: params[:page])
 end
 
 def show
	@category = Category.find(params[:id])
	@subcategories = @category.subcategories
	self.objlist
	render 'edit'
 end

 def create
	@category = current_user.categories.new(params[:category])
    if @category.save
	  flash[:success] = "Category successfully created!"
      redirect_to categories_path
    else
	  self.objlist
      render 'new'
    end
 end
 
 def update
    @category= Category.find(params[:id])
	@subcategories = @category.subcategories
    if @category.update_attributes(params[:category])
      flash[:success] = "Category updated"
	  redirect_to @category
    else
	  flash[:error] = "Category not updated"
	  self.objlist
	  render 'edit'
    end
 end
 
 def new
    self.objlist
    @category = Category.new
 end
 
 def objlist
	@persons = User.all.map { |user| [user.name, user.id] }
	@parcategories = Category.all.map { |cat| [cat.title, cat.id] }
 end
  
end
