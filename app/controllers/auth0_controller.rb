# app/controllers/auth0_controller.rb
class Auth0Controller < ApplicationController

  include LogoutHelper
  def login()
    cookies[:redirect_url] = params[:redirect_url]
    redirect_to "/auth/auth0"
  end

  def logout
    reset_session
    redirect_to logout_url.to_s
  end

  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']

    # Redirect to the URL you want after successful auth
    redirect_to cookies[:redirect_url] || root_url
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
