class Admin::UsersController < ApplicationController
  layout "admin/index"
  before_filter :admin_user
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
	flash[:success] = "User deleted!"
    redirect_to admin_users_url
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      #sign_in @user
      redirect_to edit_admin_user_path(@user)
    else
      render 'edit'
    end
  end
  
end
