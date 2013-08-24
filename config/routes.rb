Coda::Application.routes.draw do


  # custom routes
  match '/documents/:type'                => 'documents#index',     :as => :typed_documents, :constraints => {:type => /\D+/}
  match '/info/:slug'                     => 'pages#show',          :as => :view_page
  match '/intergroup'                     => 'pages#intergroup',    :as => :intergroup
  match '/contact'                        => 'messages#new',        :as => :contact
  
  match '/messages'                       => 'messages#new',              :via => :get
  match '/messages/voicemail'             => 'messages#create_voicemail', :via => :post

  match '/meetings/address/:address_id'   => 'meetings#index',      :as => :meetings_by_address
  match '/meetings/:district'             => 'meetings#index',      :as => :meetings_by_district, :constraints => {:district => /\D+/}
  
  match '/forums/:id/posts/new'           => 'forum_posts#new',     :as => :new_post_in_forum, :constraints => {:id => /\d+/}
  match '/forum_posts/:id/replies/new'    => 'forum_replies#new',   :as => :new_reply_to_post, :constraints => {:id => /\d+/}
  
  match 'announcements_ticker'            => 'announcements#index', :as => :announcements_ticker, :defaults => {:limit => 5, :format => 'json'}
  
  
  # resources
  resources :announcements, :only => [:show, :index], :default => {:format => 'html'}
  resources :documents, :only => [:show, :index]
  resources :motions, :only => [:show, :index]
  resources :intergroup_sessions, :only => [:show, :index]
  resources :meetings, :only => [:show, :index]
  resources :transactions
  resources :messages, :only => [:new, :create, :show]
  resources :forums, :only => [:index, :show]
  resources :forum_posts
  resources :forum_replies, :only => [:create]


  # admin custom routes
  match '/admin'                                  => 'admin/admin#admin',                  :as => :admin                                 
  match '/admin/documents/add_transaction'        => 'admin/documents#add_transaction',    :as => :add_admin_document_transaction
  match '/admin/documents/update_transaction/:id' => 'admin/documents#update_transaction', :as => :update_admin_document_transaction
  match '/admin/messages/:id/status/:status'      => 'admin/messages#status',              :as => :update_admin_message_status
  match '/admin/messages/all'                     => 'admin/messages#index',               :as => :admin_all_messages, :defaults => { :show_all => 'true' }
  
  # admin resources
  namespace :admin do
    resources :announcements
    resources :contents
    resources :pages
    resources :documents
    resources :motions
    resources :intergroup_sessions
    resources :districts
    resources :meetings
    resources :meeting_addresses
    resources :menus
    resources :messages
    resources :transactions
    resources :site_configs
    resources :forums
  end
  

  # twilio routes
  match '/twilio/start'                                                  => 'twilio#start', :defaults => { :format => 'xml' }
  match '/twilio/district_list'                                          => 'twilio#district_list', :defaults => { :format => 'xml' }
  match '/twilio/meeting_list/:district_id'                              => 'twilio#meeting_list', :defaults => { :format => 'xml' }
  match '/twilio/meeting_list/:district_id/meeting_detail/:meeting_id'   => 'twilio#meeting_detail', :defaults => { :format => 'xml' }
  match '/twilio/info/:key'                                              => 'twilio#info', :defaults => { :format => 'xml' }
  match '/twilio/voicemail'                                              => 'twilio#voicemail', :defaults => { :format => 'xml' }
  
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
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
