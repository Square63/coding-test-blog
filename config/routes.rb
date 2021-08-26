Rails.application.routes.draw do
  root 'dashboard#index'

  resources :posts do
    resources :comments
    member do
      get :like
    end
  end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
