SpeedTrapp::Application.routes.draw do
  resources :sessions
  # I probably wouldn't keep 'users#new' as your root path
  # When a user goes to your homepage they will be asked to sign in even if they are 
  # signed in. This creates a confusing flow for the user
  root 'users#new' 

  # As all of your routes are restful you can just use resources to create these
  # If you do not want to create all of the restful routes for a resource you can use only
  # example: resources :users, only: [:new, :create, :show] 
  get'/users/new', to: 'users#new', as: 'users_new'
  post '/users', to: 'users#create', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  
  get '/traps/new', to: 'traps#new', as: 'trap'
  post '/traps', to: 'traps#create' 
  get '/traps/show', to: 'traps#show'

  delete '/signout', to: 'sessions#destroy'
  get '/signin', to: 'sessions#new'


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
