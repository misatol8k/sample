Rails.application.routes.draw do
  # get 'blogs/index' 行削除した
  get '/blogs', to: 'blogs#index' #追記する
  get '/stocks', to: 'stocks#index' #追記する
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
