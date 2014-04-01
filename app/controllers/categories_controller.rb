class CategoriesController < ApplicationController
before_filter :signed_in_user

 def index
	#@categories = Category.where(parent_id: nil).paginate(page: params[:page])
	@categories = current_user.categories.where(parent_id: 1).paginate(page: params[:page])
 end
 
 def show
	@category = Category.find(params[:id])
	@subcategories = @category.subcategories
	if !@category.parent.nil?
		render 'edit'
	else
		redirect_to categories_path
	end
 end

 def create
	@category = current_user.categories.new(params[:category])
    if @category.save
	  flash[:success] = "Category successfully created!"
      redirect_to categories_path
    else
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
	  render 'edit'
    end
 end
 
 def new
    @category = Category.new
 end
 
def destroy
	Category.find(params[:id]).destroy
	flash[:success] = "Category and subcategories deleted!"
	redirect_to categories_path
end
  
end
