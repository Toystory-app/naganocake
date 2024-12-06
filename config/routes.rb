Rails.application.routes.draw do
  
  
  namespace :admin do
    #urlにadminが指定される
    get 'homes/top' => 'homes#top', as: 'top'
  end
  devise_for :admins, skip: [:registraions, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: "homes#top"
    #urlにpublicが指定されない
    get 'customers/mypage' => 'customers#show', as: 'mypage'
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
