class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    #flash[:green] = "Authenticated to Facebook !"
    render text: request.env['omniauth.auth'].to_yaml
  end
  def twitter
    render text: request.env['omniauth.auth'].to_yaml
  end
end
