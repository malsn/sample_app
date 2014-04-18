class Site::StaticPagesController < ApplicationController
  layout 'site/index'
  
  def feed
	if signed_in?
		@micropost = current_user.microposts.build
		@feed_items = current_user.feed.paginate(page: params[:page])
	end
  end
  
  def front
	
  end

  def help
  end
  
  def about
  end
  
end
