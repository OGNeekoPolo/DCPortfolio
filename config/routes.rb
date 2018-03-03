Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           sign_up: 'register' }

  get 'about-me', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: :portfolio_show

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root 'pages#home'
end
