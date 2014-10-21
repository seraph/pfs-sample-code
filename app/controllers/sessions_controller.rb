class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      # login
      session[:user_id] = @user.id
      redirect_to users_path
    else
      # incorrect password or username combination
      flash.now[:error] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Successfully logged out'
    redirect_to root_path
  end
end