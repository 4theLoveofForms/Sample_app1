class UsersController < ApplicationController
before_action :require_login, only: [:index, :edit, :update, :destroy] 
before_action :correct_user,  only: [:edit, :update]
before_action :admin_user,    only: [:destroy]
 
 
  def index
    @users = User.paginate(page: params[:page])
  end 
 
  def show
    @user = User.find(params[:id])
  
  end
 
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
    else
        render 'new'
    end
  end
  
  def edit
 #   @user = User.find(params[:id]) # current_user means only one user can it be
  end

  def update
#    @user = User.find(params[:id]) # dito
    if @user.update(user_params)
      flash[:sucsess] = "Profile updated"
      redirect_to @user 
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleated"
    redirect_to users_url
  end 
  
  
 private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation )
    end
    
    #before filters
    
    #confirms a logged-in-user.
    def require_login
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end 
    
    #confirms the correct user
    def correct_user
      @user = User.find(params[:id]) 
      redirect_to(root_url) unless current_user?(@user)
    end
    
    #confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end 
    
end
