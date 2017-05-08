
class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find_by id: params[:id]
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feeds.paginate page: params[:page]
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
