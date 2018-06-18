module Auth0Helper
  private

  # Is the user signed in?
  # @return [Boolean]
  def user_signed_in?
    session[:userinfo].present?
  end

  # Set the @current_user or redirect to public page
  def authenticate_user!
    # Redirect to page that has the login here
    if user_signed_in?
      @current_user = session[:userinfo]
    else
      cookies[:redirect_url] = params[:redirect_url]
      redirect_to "/auth/auth0"
    end
  end

  # What's the current_user?
  # @return [Hash]
  def current_user
    @current_user = session[:userinfo]
  end
end
