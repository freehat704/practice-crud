def current_user
	@user ||= User.find_by_email session[:user]
end