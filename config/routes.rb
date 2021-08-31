Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/breweries', to: 'breweries#index'
  get '/breweries/new', to: 'breweries#new'
  post '/breweries', to: 'breweries#create'
  delete '/breweries/:id', to: 'breweries#destroy'
  get '/breweries/:id/edit', to: 'breweries#edit'
  patch 'breweries/:id', to: 'breweries#update'
  get '/breweries/:id', to: 'breweries#show'
  get '/brews', to: 'brews#index'
  get '/brews/:id/edit', to: 'brews#edit'
  patch '/brews/:id', to: 'brews#update'
  get '/brews/:id', to: 'brews#show'
  get '/breweries/:id/brews', to: 'brewery_brews#index'
  get '/breweries/:id/brews/new', to: 'brewery_brews#new'
  post '/breweries/:id/brews', to: 'brewery_brews#create'
  delete '/brews/:id', to: 'brews#destroy'


  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/boozes', to: 'boozes#index'
  get '/boozes/:id', to: 'boozes#show'
  get '/manufacturers/:id/boozes', to: 'manufacturer_boozes#index'
end
