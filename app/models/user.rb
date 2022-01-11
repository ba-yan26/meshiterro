class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          # パスワードの正確性を検証
          :registerable,
          # ユーザー登録や編集、削除
          :recoverable,
          # パスワードをリセット
          :rememberable,
          # ログイン情報を保存
          :validatable
          # emailのフォーマットなどのバリデーション
  has_many :post_images, dependent: :destroy
  # Userモデルはpost_imageモデルをN個持っている（has_many :post_images）
  # 1:Nの1側が削除された時、N側を全て削除する（dependent: :destroy）
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image
  # profile_imageという名前でActivestorageでプロフィール画像を保存できるようにする

  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: size).processed
  end

end
