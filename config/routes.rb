Ruby::Application.routes.draw do
  get "prijava/prijavime"
  post "prijava/newsession"
  get "prijava/odjava"
  get "zahtevki/pregled"
  get "zahtevki/dodaj"
  get "zahtevki/uredi/:id", to: 'zahtevki#uredi', as: 'uredi'
  post "zahtevki/izbrisi/:id", to: 'zahtevki#izbrisi', as: 'izbrisi'
  get "zahtevki/potrdi"
  get "zahtevki/prevzemi"
  get "zahtevki/eskaliraj"
  get "front_page/index"

  root  'front_page#index'
  match 'dodaj',   to: 'zahtevki#dodaj',   via: 'get'
  match 'zahtevki',   to: 'zahtevki#pregled',   via: 'get'
  #match 'uredi',   to: 'zahtevki#uredi',   via: 'get'
  #match 'izbrisi',   to: 'zahtevki#izbrisi',   via: 'get'
  match 'potrdi',   to: 'zahtevki#potrdi',   via: 'get'
  match 'prevzemi',   to: 'zahtevki#prevzemi',   via: 'get'
  match 'eskaliraj',   to: 'zahtevki#eskaliraj',   via: 'get'
  match 'prijava',   to: 'prijava#prijavime',   via: 'get'
  match 'odjava',   to: 'prijava#odjava',   via: 'get'

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
