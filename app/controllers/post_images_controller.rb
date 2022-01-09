class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # user_idはユーザをIDで特定するために使用するカラム
    # current_user.idはログイン中のユーザーの情報を取得できる便利な記述（deviseをインストールをすることで使えるようになる）
    @post_image.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end
  
  def destroy
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:image,:shop_name,:caption)
  end
  
end
