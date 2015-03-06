Rails.application.routes.draw do
  mount Judge::Engine => '/judge'

  get 'home/index'
  root 'home#index'

  get 'artists/signup' => 'artists#signup'
  post 'artists/signup' => 'artists#create'
  
  get 'voters/signup' => 'voters#signup'
  post 'voters/signup' => 'voters#create'

  post 'artists/login' => 'sessions#create_artist'
  post 'voters/login' => 'sessions#create_voter'
  post 'admins/login' => 'sessions#create_admin'

  get 'artists/logout' => 'sessions#delete_artist'
  get 'voters/logout' => 'sessions#delete_voter'
  get 'admins/logout' => 'sessions#delete_admin'

  get 'artists/grant_submissions' => 'grant_submissions#index'

  post 'voters/vote' => 'voters#vote'

  get 'admins/assign' => 'admins#assign'
  get 'admins/reveal' => 'admins#reveal'


  resources :artists, :voters, :admins, :grant_submissions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
