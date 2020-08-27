Rails.application.routes.draw do
  get 'doses/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 resources :cocktails, only: [:index, :show, :create, :new, :destroy] do 
  resources :doses, only: [:create, :new]
 end
end
