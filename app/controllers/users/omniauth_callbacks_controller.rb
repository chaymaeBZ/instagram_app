class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  before_action :fetch_user
  def facebook
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      flash[:green] = "Authenticated to Facebook !"
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def twitter
    #render text: request.env["omniauth.auth"].info.email.to_yaml
    if @user.persisted?
      sign_in_and_redirect @user #this will throw if @user is not activated
      flash[:green] = "Authenticated to Twitter !"
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def failure
    redirect_to root_path
  end

  private
    def fetch_user
      @user = User.from_omniauth(request.env['omniauth.auth'])
    end

end
