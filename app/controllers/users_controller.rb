class UsersController < ApplicationController


  before_filter :authorize, only: [:new, :edit, :update, :destroy, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Thank you for signing up"
    else
      render 'new'
    end
  end

  def show

    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path

  end

private
  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
