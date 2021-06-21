Rails.application.routes.draw do
  root 'properties#index'
  resources :properties do
    collection do
      post :confirm
    end
  end
end
