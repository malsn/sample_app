class Admin::ContentsController < ApplicationController
before_filter :signed_in_user

def edit
	@category = Category.find(params[:category_id])
	@contents = @category.contents.paginate(page: params[:page], per_page: 10)
	@content = Content.find(params[:id])
	if !@content.nil?
		render 'edit'
	else
		redirect_to path_to(@content.category)
	end
end

def new
	@content = Content.new
	@category = Category.find(params[:category_id])
	@contents = @category.contents.paginate(page: params[:page], per_page: 10)
end

def create
	@category = Category.find(params[:category_id])
	@content = @category.contents.new(params[:content])
	if @content.save
	  flash[:success] = "Content successfully created!"
	  redirect_to edit_admin_category_content_path(@category, @content)
	else
	  render 'new'
	end
end
 
def update
	@category = Category.find(params[:category_id])
	@content= Content.find(params[:id])	
	if @content.update_attributes(params[:content])
	  flash[:success] = "Content updated"
	  redirect_to edit_admin_category_content_path(@category, @content)
	else
	  flash[:error] = "Content not updated"
	  render 'edit'
	end
end

def destroy
	@category = Category.find(params[:category_id])
    Content.find(params[:id]).destroy
	flash[:success] = "Content deleted!"
    redirect_to edit_admin_category_path(@category)
end

end
