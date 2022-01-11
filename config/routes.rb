Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    # resource(単数形)はURLに/:idが含まれなくなる
    # どのユーザーのどの投稿かが特定できていれば、それを削除(destroy)、追加(create)
    # すればいいのかがわかる為、単数形で記述する
    resources :post_comments, only: [:create, :destroy]
    # コメントは投稿画像に対してコメントされる。post_commentsはpost_imagesに結びつく
  end
  resources :users, only: [:show, :edit, :update]
  # resources :post_images(コントローラの同じ名前のアクション)と記述すると
  # new show indec edit create destroy update のルーティングを自動生成してくれる
  # onlyオプションを使用することで、生成するルーティングを限定することができる
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
