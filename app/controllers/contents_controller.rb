class ContentsController < ApplicationController
before_filter :signed_in_user

def edit
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
end

end
