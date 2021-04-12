class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to orders_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path
  end

  private

  def user_params
    params.require(:user_id).permit(:email, :password)
  end
end

