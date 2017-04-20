class FavoritesController < ApplicationController
    before_action :require_user_logged_in

  def create
    user = current_user
    micropost = Micropost.find(params[:favorite_micropost_id])
    user.favo(micropost)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_to micropost.user
  end

  def destroy
    user = current_user
    micropost = Micropost.find(params[:favorite_micropost_id])
    user.unfavo(micropost)
    flash[:success] = '投稿のお気に入りをはずしました。'
    redirect_to user
  end
  
end
