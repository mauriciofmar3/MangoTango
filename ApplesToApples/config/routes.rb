ApplesToApples::Application.routes.draw do
  
    root :to => 'game#login'
    get '/login', to: 'game#login'
    get '/lobby', to: 'game#lobby'
    get '/about', to: 'game#about'
    get '/user/index', to: 'user#index'
    get '/user/login/:name', to: 'game#login'
    get '/user/register/:name', to: 'game#login'
    
    get '/user/register/', to: 'game#register'
    
    get '/game/create/:name/rounds/:rounds/players/:players', to: 'game#create'
    
    get '/cards/delete_all', to: 'card#delete_all'
  
  
    get '/game/join/:game', to: 'game#join'
    get '/game/:game/join/:name/rounds/:rounds/players/:players', to: 'game#join'
  
    # js ajax calls
    get '/cards/hand/game/:game/', to: 'game#hand'
    get '/cards/hand/game/:game/word/:word', to: 'game#play_card'
    get '/cards/judge/game/:game/', to: 'game#load_judge'
    get '/cards/judge/game/:game/word/:word', to: 'game#play_card'
    
    get '/chat', to: 'chat#index'
    
    
    get '/tutorial', to: 'game#tutorial'
    
    
    # refresh stuff
    get '/game/:game/current_adjective/', to: 'game#current_adjective'
    get '/game/:game/player_list/', to: 'game#player_list'
    get '/game/:game/round_information/', to: 'game#round_information'
    get '/game/:game/round_winner/', to: 'game#round_winner'
    get '/game/:game/words_used/', to: 'game#words_used'
    

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
