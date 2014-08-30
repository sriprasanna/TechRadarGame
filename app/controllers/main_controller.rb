class MainController < ApplicationController
  before_action :redirect_if_not_logged_in, only: :won_card
  
  def won_card
    card = Card.find_by_uuid(params[:uuid])
    previous_owner = card.user
    current_user.won(card)
    flash[:notice] = "You have won the card from #{view_context.link_to('John Q Public', '/profile/' + previous_owner.id.to_s)}!".html_safe
    redirect_to "/"
  end
  
  def profile
    @user = User.find params[:id]
  end
  
  private
  def redirect_if_not_logged_in
    if not logged_in?
      flash[:notice] = "Please log in to continue."
      redirect_to "/login"
    end
  end
end
