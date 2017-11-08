Rails.application.routes.draw do
   root 'static_pages#home'
  get  '/help',    to: 'static_pages#help', as: 'helf'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get     "/login"    => "sessions#new"
  post    "/login"    => "sessions#create"
  delete  "/logout"   => "sessions#destroy"

  resources :users
  resources :microposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
