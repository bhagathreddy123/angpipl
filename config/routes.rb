Rails.application.routes.draw do
  resources :words, only: %i[index new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
