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
  map.register "register", :controller => :static, :action => :register
  map.case_studies "case_studies", :controller => :static, :action => :case_studies

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

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
