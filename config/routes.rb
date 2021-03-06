Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'products#index'
  resources :products, only: [:index]

  namespace :admin do
    resources :products do
      member do
        delete :delete_attachment
      end
    end
    root "products#index"
  end

end
