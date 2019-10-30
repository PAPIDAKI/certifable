class UsersController < ApplicationController
  before_action :logged_in_user,only: [:edit,:update,:destroy,:index]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin, only: [:destroy]
  def index 
    @users = User.paginate(page: params[:page]) 
  end

  def destroy 
    User.find(params[:id]).destroy
    flash[:success]="User deleted"
    redirect_to users_url
  end

  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user =User.new(user_params)
    if @user.save
      log_in @user
      flash[:success]="Welcome to the  Certifable repo"
      redirect_to  @user
    else
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      # handle succesful update 
      flash[:succes]="Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  

  private 
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation )
  end

  def logged_in_user
      unless logged_in?
      flash[:danger]="Please log in."
      redirect_to login_url 
      end
  end

  def correct_user
      @user=User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end

  #confirms admin user or else goes to index page
   def admin 
     redirect_to root_url unless current_user.admin?
   end
end


