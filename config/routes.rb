Spree::Core::Engine.routes.draw do
  scope '(:locale)', locale: /#{Spree.available_locales.join('|')}/, defaults: { locale: nil } do
    namespace :admin do
      resources :products do
        resources :sale_prices, only: [:index, :create, :destroy]
      end
    end

    get '/sale',        to: 'home#sale', as: :sale
    get '/sale/t/*id/', to: 'home#sale', as: :sale_taxon
  end
end
