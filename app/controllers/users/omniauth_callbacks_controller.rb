class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    #flash[:green] = "Authenticated to Facebook !"
    redirect_to create_url
  end
end
