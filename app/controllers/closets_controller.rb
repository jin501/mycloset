class ClosetsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @closet = current_user.mycloset
  end

  def edit
    @closet_item = ClosetItem.find_or_create_by(closet_id: current_user.mycloset.id)
    
  end

end
