Rails.application.routes.draw do
  resources :pokemons
  resources :pokemons, param: :name do
    collection do
      get 'name/:name', to: 'pokemons#showByName'
    end
  end
  resources :pokemons, param: :type do
    collection do
      get 'type/:type', to: 'pokemons#showByType'
    end
  end
  resources :items
  resources :items, param: :name do
    collection do
      get 'name/:name', to: 'items#showByName'
    end
  end
  resources :items, param: :category do
    collection do
      get 'category/:category', to: 'items#showByCategory'
    end
  end

end
