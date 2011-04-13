GladneyreunionOrg::Application.routes.draw do
  
  # devise_for :admin, :controllers => {:sessions => "admin/sessions"}, :only => [:new, :create, :destroy]
  # 
  # devise_scope :admin do
  #   get '/login' => 'admin/sessions#new'
  #   get '/logout' => 'admin/sessions#destroy'
  # end
  # 
  # namespace "manage", :module => "admin" do
  #   resources :registrants, :path => 'registrations',  :controller => "registrations"
  # end

  #scope :protocol => "https" do
  devise_for :admin, :controllers => {:sessions => "admin/sessions"}, :only => [:new, :create, :destroy]

  devise_scope :admin do
    get '/login' => 'admin/sessions#new'
    get '/logout' => 'admin/sessions#destroy'
  end

  namespace "manage", :module => "admin" do
    resources :registrants, :path => 'registrations',  :controller => "registrations"
  end
  
  get '/register' => 'registrants#new'
  get '/registration/modify' => 'registrants#credentials'
  post '/registration/validate' => 'registrants#validate'
  get '/registration/:conf_num/edit' => 'registrants#edit', :as => 'edit_registration'
  put '/registration/:conf_num' => 'registrants#update', :as => 'update_registration'
  get '/registration/cancel-edit' => 'registrants#cancel_edit', :as => 'cancel_edit'
  #end
  #get 'registration/confirm' => 'confirmation#show'

  resources :registrants, :path => 'registration', :only => [:create, :update], :as => 'registration' do
    get :confirmation, :on => :member, :as => 'confirm'
  end
  

  # Static Pages
  scope :controller => :pages do 
    get '/committee'  => 'pages#committee'
    get '/contact'  => 'pages#contact'
    get '/hotel'  => 'pages#hotel'
    get '/letter'  => 'pages#letter'
    get '/schedule'  => 'pages#schedule'
  end
  
  # Redirected External Routes
  match '/facebook', :to => redirect("http://www.facebook.com/event.php?eid=125016634236366")
  
  # Homepage
  root  :to => "pages#home", :via => :get

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
