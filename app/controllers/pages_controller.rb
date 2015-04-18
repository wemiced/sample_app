class PagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact
    @titre = "Contact"
  end

  def about
    @titre = "About"
  end

  def help
    @titre = "Help"
  end

end
