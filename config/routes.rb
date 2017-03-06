Rails.application.routes.draw do
  resources :categories
  
  #root 'controller#function'
  root 'categories#index'
  
  #adds the CROD 
  resources :products
  
  #seed when URL provided
  post '/seed' => 'categories#seed'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
