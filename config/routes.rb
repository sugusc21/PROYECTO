Rails.application.routes.draw do

  # get 'stakeholders/index'

  # get 'stakeholders/new'

  # get 'stakeholders/create'

  # get 'stakeholders/edit'

  # get 'stakeholders/destroy'

  # get 'stakeholders/show'

  resources :mainprojects do
    resources :stakeholders
    member do 
      post 'process_stakeholders'
    end

  end

  resources :mainprojects do
    resources :messages
    member do 
      post 'process_messages'
    end

  end

  # get 'messages/index'

  # get 'messages/new'

  # get 'messages/edit'

  # get 'messages/show'

  resources :mainprojects do
    resources :milestones

    member do 
      post 'preview_milestones'
      post 'process_milestones'
    end
  end

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  get 'pages/index'

  get 'pages/about'

  get 'pages/product'

  get 'projectmil' => 'milestones#projectmil'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

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
