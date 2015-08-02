Rails.application.routes.draw do
  
  resources :concerts do
  	resources :comments
  end


end
