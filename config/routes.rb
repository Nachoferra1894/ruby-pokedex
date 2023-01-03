Rails.application.routes.draw do
  resources :item_categories
  resources :items
  resources :pokemon_abilities
  resources :abilities
  resources :pokemon_types
  resources :types
  resources :pokemons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
