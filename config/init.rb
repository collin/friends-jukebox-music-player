# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = 'ab07820008075e93ae707f20b459334d2f1bd255'  # required for cookie session store
  c[:session_id_key] = '_friends_jukebox_music_player_session_id' # cookie session id key, defaults to "_session_id"

  # Added to support the Compass SASS MetaFramework
  c[:compass] = {
    :stylesheets => 'app/stylesheets',
    :compiled_stylesheets => 'public/stylesheets/compiled'
  }
  
end
 
Merb::BootLoader.before_app_loads do
  MusicDnsKey = "bd35c61601aacf8662c98033f7596492"
end
 
Merb::BootLoader.after_app_loads do
  Merb::Authentication.register :form_login, Merb.root / "merb/merb-auth/form_login.rb"
  Merb::Authentication.activate! :form_login

  Merb::Authentication.default_strategy_order = [
    Merb::Authentication::Strategies::FormLogin
  ]
  
  DataMapper.auto_migrate! if Merb.env == 'profile'
end

class String
  # Transforms this string into an escaped POSIX shell argument.
  def shell_escape
    inspect.gsub(/\\(\d{3})/) {$1.to_i(8).chr}
  end
end

class Array
  def random
    self[(rand * self.length).floor]
  end
end
