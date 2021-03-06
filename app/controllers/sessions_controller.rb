class SessionsController< ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(current_user), notice: "Logged in!!!"
    else
      flash.now.alert = "User name or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!!!"
  end

end
