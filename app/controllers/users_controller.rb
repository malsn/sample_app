class UsersController < ApplicationController
  layout "site/index"
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :signed_in_user_to_new_or_create, only: [:new, :create]
  before_filter :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
	@microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def create
   @user = User.new(params[:user])
    if @user.save
	  sign_in @user
	  flash[:success] = "Добро пожаловать!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      #sign_in @user
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
	
	def signed_in_user_to_new_or_create
      if signed_in?
        redirect_to root_path
      end
    end
	
	def correct_user
      @user = User.find(params[:id])
      redirect_to(users_path) unless current_user?(@user)
    end
  
end
