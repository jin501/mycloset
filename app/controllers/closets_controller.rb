class ClosetsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @closet = current_user.closets.first
  end

  def edit
  end

end
