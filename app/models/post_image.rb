class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # PostImageモデルでuser_idに関連付けされていてUserモデルを参照できる
  # belongs_toは１：NのN側なので関連したUserモデルを参照できる
  
end
