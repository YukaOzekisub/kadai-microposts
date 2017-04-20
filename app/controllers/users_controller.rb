class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers, :favorite_microposts]
 
  def index
    @users = User.all.page(params[:page])
  end

  def show
    set_icon
    @microposts = @user.microposts.order('created_at DESC').page(params[:page])
    if current_user == @user
      @microposts = @user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      return
    end
    
    flash.now[:danger] = 'ユーザの登録に失敗しました。'
    render :new
  end
  
  def followings
    set_icon
    @followings = @user.followings.page(params[:page])
  end
  
  def followers
    set_icon
    @followers = @user.followers.page(params[:page])
  end
  
  def favorite_microposts
    set_icon
    @favorite_microposts = @user.favorite_microposts.order('created_at DESC').page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_icon
    @user = User.find(params[:id])
    @micropost = @user.microposts.build
    counts(@user)
  end
end
