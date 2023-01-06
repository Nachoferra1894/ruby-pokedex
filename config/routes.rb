Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  resource :users do
    collection do
      post 'login', to: 'users#login'
      post 'create', to: 'users#create'
    end
  end

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
