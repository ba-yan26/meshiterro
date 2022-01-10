class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    # 特定のユーザー(@user)に関連づけられている投稿全て(post_images)を取得し
    # @post_imagesに渡すという処理を行う
  end

  def edit
  end
end
