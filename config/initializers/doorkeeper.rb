Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    current_user || begin
      session[:user_return_to] = request.fullpath
      redirect_to new_user_session_url  
    end
  end

  admin_authenticator do
    current_user || redirect_to(new_user_session_url)
  end
end