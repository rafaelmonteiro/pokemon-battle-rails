Rails.application.routes.draw do
  get 'all', to: 'pokemons#all'
  post 'select', to: 'pokemons#select'
  post 'hit', to: 'pokemons#hit'

  root 'pokemons#index'
end