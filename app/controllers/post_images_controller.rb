class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # user_idはユーザをIDで特定するために使用するカラム
    # current_user.idはログイン中のユーザーの情報を取得できる便利な記述（deviseをインストールをすることで使えるようになる）
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    # @post_images = PostImage.all
    @post_images = PostImage.page(params[:page])
    # PostImage.allではテーブル内の全データが取得されていた
    # pageメソッドを使うことで１ページ分を決められた数だけ新しい順に取得できるようになる
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    # コメントは詳細画面に表示するのでpost_imagesコントローラーにpost_commentの空のインスタンス変数を用意する
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  private

  def post_image_params
    params.require(:post_image).permit(:image,:shop_name,:caption)
  end

end
