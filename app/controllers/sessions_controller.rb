class SessionsController < ApplicationController
  before_action :check_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to login_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private 

  def check_login
    if logged_in?
      redirect_to root_path, notice: "You are already login"
    end
  end
end
