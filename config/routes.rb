Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # http://localhost:3000/users/auth/instagram/callback
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: [:show]
 delete '/logout', to: 'devise/sessions#destroy'
 resources :closets
 resources :items
 patch '/items/:id' => 'items#update', as: :update_item
 
 root 'welcome#home'

end
