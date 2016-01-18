Rails.application.routes.draw do


  devise_for :users



  resources :heroe_sets, only: [:index]

  get 'store', to: 'heroe_sets#index'

  #recursos anidados
  resources :heroes do
    resources :abilities
    resources :heroe_sets
  end

  get 'heroes/index'

  root "heroes#index"




end
