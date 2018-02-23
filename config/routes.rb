Rails.application.routes.draw do
  get 'about-me', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: :portfolio_show


  resources :blogs

  root 'pages#home'
end
