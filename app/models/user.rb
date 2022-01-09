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
end
