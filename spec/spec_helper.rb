require "rubygems"

# Add the local gems dir if found within the app root; any dependencies loaded
# hereafter will try to load from the local gems before loading system gems.
if (local_gem_dir = File.join(File.dirname(__FILE__), '..', 'gems')) && $BUNDLE.nil?
  $BUNDLE = true; Gem.clear_paths; Gem.path.unshift(local_gem_dir)
end

require "merb-core"
require "spec" # Satisfies Autotest and anyone else not using the Rake tasks

require 'metaid'

def makeable klass, defaults = {}
  klass.meta_def :make_defaults do
    instance = {}
    defaults.each do |key, value|
      instance[key] = value.respond_to?(:call) ? value.call : value
    end
    instance
  end
  
  klass.instance_eval do
    def self.make attrs={}
      send attrs.delete(:new) ? 'new' : 'create', make_defaults.merge(attrs)
    end
  end
end

# this loads all plugins required in your init file so don't add them
# here again, Merb will do it for you
Merb.start_environment(:testing => true, :adapter => 'runner', :environment => ENV['MERB_ENV'] || 'test')

Spec::Runner.configure do |config|
  config.include(Merb::Test::ViewHelper)
  config.include(Merb::Test::RouteHelper)
  config.include(Merb::Test::ControllerHelper)
end
