class FavoritesController < ApplicationController
    before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:favorite_micropost_id])
    current_user.favo(micropost)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_to user
  end

  def destroy
    micropost = Micropost.find(params[:favorite_micropost_id])
    current_user.favo(micropost)
    flash[:success] = '投稿のお気に入りをはずしました。'
    redirect_to user
  end
  
end
