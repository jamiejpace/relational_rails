Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/breweries', to: 'breweries#index'
  get '/breweries/:id', to: 'breweries#show'
  get '/brews', to: 'brews#index'
  get '/brews/:id', to: 'brews#show'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/boozes', to: 'boozes#index'
  get '/boozes/:id', to: 'boozes#show'
  get '/manufacturers/:id/boozes', to: 'manufacturer_boozes#index'
end
