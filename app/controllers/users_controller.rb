class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    protected_params = Hash.new
    user_params.each do |key,value|
      protected_params[key.to_sym] = value unless value.nil?
    end
    if @user.update_attributes(protected_params)
      redirect_to root_path, notice: 'Movie was successfully updated.'
    else
      render 'edit'
    end
  end

  private 
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
