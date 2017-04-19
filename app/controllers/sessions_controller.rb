class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
      return
    end
    
    flash.now[:danger] = 'ログインに失敗しました。'
    render 'new'
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end
  
  private 
  
  def login(email, password)
    @user = User.find_by(email: email)
    return false if @user.nil?
    return false if @user != @user.authenticate(password)
    
    session[:user_id] = @user.id
    return true
  end
end
