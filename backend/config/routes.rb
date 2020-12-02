Rails.application.routes.draw do
  scope defaults: {format: :json}, constraints: {id: /\d+/} do
    root to: 'home#index'
    
    scope ENV['BASE_HREF'] do
      root to: 'home#index', as: 'base_href_root'
      resources :authentication, only: %i[create]
      resources :estados, only: %i[index]
      resources :cidades, only: %i[index]
      resources :pessoas, only: %i[index show create update]
      resources :usuarios, only: %i[index show create update]
    end
  
  end
end
