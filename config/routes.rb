 Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'warehouses#index'
  resources :warehouses, only:[:show, :new, :create, :edit, :update, :destroy]
  resources :suppliers, only:[:index, :show]
end
