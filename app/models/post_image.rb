class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  # PostImageモデルでuser_idに関連付けされていてUserモデルを参照できる
  # belongs_toは１：NのN側なので関連したUserモデルを参照できる
  
  def get_image
    unless image.attached?
    # 画像が設定されていない場合
      file_path = Rails.root.join('app/assets/images/no_image.png')
      # app/assets/imagesに格納されているno_image.pngを表示させる
      image.attach(io: File.open(file_path), filename: 'default-image.png',content_type:'image/png')
    end
    image
  end
end
