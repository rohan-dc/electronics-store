Rails.application.routes.draw do
  resources :categories
  
  #root 'controller#function'
  root 'categories#index'
  
  #adds the CROD 
  resources :products
  
  post 'categories/importcsv'
  
  post '/seed' => 'categories#seed'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
