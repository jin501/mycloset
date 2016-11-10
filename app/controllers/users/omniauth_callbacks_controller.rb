class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    byebug
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
end

  def instagram
    #hits this one
    @user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.email = auth[:extra][:raw_info][:username]
    end
    @user.provider = 'instagam'
    @user.save
    session[:user_id] = @user.id

    sign_in_and_redirect @user
  end

  def auth
    request.env['omniauth.auth']
  end

end
