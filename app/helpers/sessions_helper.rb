module SessionsHelper
#logs in the given user
  def log_in(user)
    session[:user_id]=user.id
  end

  #current_user is used in every auth way 
  #The purpose of the current_user id to allow constructors sa <%=current_user.name %> and redirect_to current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # returns true if the user is logged_in ,false otherwise 
  def logged_in?
    ! current_user.nil?
    #if current_user && !current_user.nil
  end

  #Log out the current user
    def log_out
      session.delete(:user_id)
      @current_user=nil
    end
end
