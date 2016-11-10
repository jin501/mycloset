class WelcomeController < ApplicationController

  def home
    if current_user
      closet = Closet.find_or_create_by(user_id: current_user.id)
      redirect_to closet_path(closet)
    end
  end

end
