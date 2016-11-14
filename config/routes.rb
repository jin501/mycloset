Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # http://localhost:3000/users/auth/instagram/callback
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: [:show, :edit, :update]

  delete '/logout', to: 'devise/sessions#destroy'
  resources :closets do
   resources :items
  end

 patch '/closets/:closet_id/items/:id' => 'items#update', as: :update_item

 root 'welcome#home'

end
