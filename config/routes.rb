Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :post_images, only: [:new, :create, :index, :show]
  # resources :post_images(コントローラの同じ名前のアクション)と記述すると
  # new show indec edit create destroy update のルーティングを自動生成してくれる
  # おんょぷションを使用することで、生成するルーティングを限定することができる
  get '/homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
