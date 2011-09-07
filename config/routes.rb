ActionController::Routing::Routes.draw do |map|

  map.filter 'locale'
  map.root :controller => :static, :action => :home

  map.login "login", :controller => :user_sessions, :action => :new
  map.logout "logout", :controller => :user_sessions, :action => :destroy

  map.home "home", :controller => :static, :action => :home
  map.about "about", :controller => :static, :action => :about
  map.faqs "faqs", :controller => :static, :action => :faqs
  map.contact "contact", :controller => :static, :action => :contact
  map.participate "participate", :controller => :static, :action => :participate
  map.benefits "benefits", :controller => :static, :action => :benefits
  map.project "project", :controller => :static, :action => :project
  map.acknowledgements "acknowledgements", :controller => :static, :action => :acknowledgements

  map.make_user_admin "make_user_admin/:id", :controller => :users, :action => :make_user_admin

  map.areas "areas.json", :controller => :countries, :action => :areas
  map.iccaCountryDetails "iccaCountryDetails.json", :controller => :countries, :action => :iccaCountryDetails

  map.new_associated_photo ":type/:id/photos/new", :controller => :photos, :action => :new
  map.new_associated_link ":type/:id/links/new", :controller => :links, :action => :new

  
  map.resources :users
  map.resources :user_sessions
  map.resources :countries do |countries|
    countries.resources :sites, :member => [:new]
  end
  map.resources :sites, :member => [:photos, :links] do |sites|
    sites.resources :documents, :only => [:new, :index]
  end
  map.resources :links
  map.resources :photos
  map.resources :static_contents, :only => [:new, :edit, :create, :update]
  map.resources :forms do |forms|
    forms.resources :documents, :only => [:new, :index]
  end
  map.resources :documents

  map.forgot_password 'user/forgot_password', :controller => :users, :action => :forgot_password
  map.reset_password 'user/reset_password', :controller => :users, :action => :reset_password

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
