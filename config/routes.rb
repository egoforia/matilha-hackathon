Rails.application.routes.draw do
  get 'form_user/show'

  get 'landing/index'

  devise_for :lawyers, controllers: { registrations: 'lawyers/registrations' }
  resources :answers

  resources :users

  resources :uploads

  resources :question_options

  resources :questions

  resources :field_types

  resources :forms do
    post 'send_email', to: 'forms#send_email'
  end

  resources :forms do
    get 'users/:user_id/sucesso', to: 'form_user#success', as: :success
    get 'users/:user_id', to: 'form_user#show', as: :user
    post 'users/:user_id', to: 'form_user#create', as: :user_create
  end

  resources :lawyers

  resources :field_of_works

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landing#index'

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
