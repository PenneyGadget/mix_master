Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:index, :new, :create]
  end

  resources :songs, only: [:show, :edit, :update]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
