Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
#  resources :following
  # Adds the required routes for merb-auth using the password slice
#  resources :users

#  authenticate do
#    resources :jukeboxes
#    resources :selection
#    resources :followings
#    resources :sources
#    resources :tracks
#    resources :artists
#    resources :blogs
#  end
#  
#  match("/me").
#    to(:controller => Users, :action => 'me').
#    name(:me)
#  
#  match("/").defer_to do |request, params|
#    redirect url(:me)
#  end

#  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
end
