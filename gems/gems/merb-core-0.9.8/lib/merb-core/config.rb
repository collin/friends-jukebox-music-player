require "optparse"

module Merb

  class Config

    class << self

      # ==== Returns
      # Hash:: The defaults for the config.
      def defaults
        @defaults ||= {
          :host                   => "0.0.0.0",
          :port                   => "4000",
          :adapter                => "runner",
          :reload_classes         => true,
          :fork_for_class_load    => !RUBY_PLATFORM.in?("windows", "java"),
          :environment            => "development",
          :merb_root              => Dir.pwd,
          :use_mutex              => true,
          :log_delimiter          => " ~ ",
          :log_auto_flush         => false,
          :log_level              => :info,
          :disabled_components    => [],
          :deferred_actions       => [],
          :verbose                => false,
          :name                   => "merb"
        }
      end

      # Yields the configuration.
      #
      # ==== Block parameters
      # c<Hash>:: The configuration parameters.
      #
      # ==== Examples
      #   Merb::Config.use do |config|
      #     config[:exception_details] = false
      #   end
      def use
        @configuration ||= {}
        yield @configuration
      end

      # ==== Parameters
      # key<Object>:: The key to check.
      #
      # ==== Returns
      # Boolean:: True if the key exists in the config.
      def key?(key)
        @configuration.key?(key)
      end

      # ==== Parameters
      # key<Object>:: The key to retrieve the parameter for.
      #
      # ==== Returns
      # Object:: The value of the configuration parameter.
      def [](key)
        (@configuration ||= setup)[key]
      end

      # ==== Parameters
      # key<Object>:: The key to set the parameter for.
      # val<Object>:: The value of the parameter.
      def []=(key, val)
        (@configuration ||= setup)[key] = val
      end

      # ==== Parameters
      # key<Object>:: The key of the parameter to delete.
      def delete(key)
        @configuration.delete(key)
      end

      # ==== Parameters
      # key<Object>:: The key to retrieve the parameter for.
      # default<Object>::
      #   The default value to return if the parameter is not set.
      #
      # ==== Returns
      # Object:: The value of the configuration parameter or the default.
      def fetch(key, default)
        @configuration.fetch(key, default)
      end

      # ==== Returns
      # Hash:: The config as a hash.
      def to_hash
        @configuration
      end

      # ==== Returns
      # String:: The config as YAML.
      def to_yaml
        require "yaml"
        @configuration.to_yaml
      end

      # Sets up the configuration by storing the given settings.
      #
      # ==== Parameters
      # settings<Hash>::
      #   Configuration settings to use. These are merged with the defaults.
      def setup(settings = {})
        @configuration = defaults.merge(settings)
        
        unless @configuration[:reload_classes]
          @configuration[:fork_for_class_load] = false
        end
        
        @configuration
      end

      # Parses the command line arguments and stores them in the config.
      #
      # ==== Parameters
      # argv<String>:: The command line arguments. Defaults to +ARGV+.
      def parse_args(argv = ARGV)
        @configuration ||= {}
        # Our primary configuration hash for the length of this method
        options = {}

        # Environment variables always win
        options[:environment] = ENV["MERB_ENV"] if ENV["MERB_ENV"]
        
        # Build a parser for the command line arguments
        opts = OptionParser.new do |opts|
          opts.version = Merb::VERSION

          opts.banner = "Usage: merb [uGdcIpPhmailLerkKX] [argument]"
          opts.define_head "Merb. Pocket rocket web framework"
          opts.separator '*' * 80
          opts.separator "If no flags are given, Merb starts in the " \
            "foreground on port 4000."
          opts.separator '*' * 80

          opts.on("-u", "--user USER", "This flag is for having merb run " \
                  "as a user other than the one currently logged in. Note: " \
                  "if you set this you must also provide a --group option " \
                  "for it to take effect.") do |user|
            options[:user] = user
          end

          opts.on("-G", "--group GROUP", "This flag is for having merb run " \
                  "as a group other than the one currently logged in. Note: " \
                  "if you set this you must also provide a --user option " \
                  "for it to take effect.") do |group|
            options[:group] = group
          end

          opts.on("-d", "--daemonize", "This will run a single merb in the " \
                  "background.") do |daemon|
            options[:daemonize] = true
          end
          
          opts.on("-N", "--no-daemonize", "This will allow you to run a " \
                  "cluster in console mode") do |no_daemon|
            options[:daemonize] = false
          end

          opts.on("-c", "--cluster-nodes NUM_MERBS", Integer, 
                  "Number of merb daemons to run.") do |nodes|
            options[:daemonize] = true unless options.key?(:daemonize)
            options[:cluster] = nodes
          end

          opts.on("-I", "--init-file FILE", "File to use for initialization " \
                  "on load, defaults to config/init.rb") do |init_file|
            options[:init_file] = init_file
          end

          opts.on("-p", "--port PORTNUM", Integer, "Port to run merb on, " \
                  "defaults to 4000.") do |port|
            options[:port] = port
          end

          opts.on("-o", "--socket-file FILE", "Socket file to run merb on, " \
                  "defaults to [Merb.root]/log/merb.sock. This is for " \
                  "web servers, like thin, that use sockets." \
                  "Specify this *only* if you *must*.") do |port|
            options[:socket_file] = port
          end

          opts.on("-s", "--socket SOCKNUM", Integer, "Socket number to run " \
                  "merb on, defaults to 0.") do |port|
            options[:socket] = port
          end

          opts.on("-n", "--name NAME", String, "Set the name of the application. "\
                  "This is used in the process title and log file names.") do |name|
            options[:name] = name
          end

          opts.on("-P", "--pid PIDFILE", "PID file, defaults to " \
                  "[Merb.root]/log/merb.main.pid for the master process and" \
                  "[Merb.root]/log/merb.[port number].pid for worker " \
                  "processes. For clusters, use %s to specify where " \
                  "in the file merb should place the port number. For " \
                  "instance: -P myapp.%s.pid") do |pid_file|
            options[:pid_file] = pid_file
          end

          opts.on("-h", "--host HOSTNAME", "Host to bind to " \
                  "(default is 0.0.0.0).") do |host|
            options[:host] = host
          end

          opts.on("-m", "--merb-root /path/to/approot", "The path to the " \
                  "Merb.root for the app you want to run " \
                  "(default is current working directory).") do |root|
            options[:merb_root] = File.expand_path(root)
          end

          adapters = [:mongrel, :emongrel, :thin, :ebb, :fastcgi, :webrick]

          opts.on("-a", "--adapter ADAPTER",
                  "The rack adapter to use to run merb (default is mongrel)" \
                  "[#{adapters.join(', ')}]") do |adapter|
            options[:adapter] ||= adapter
          end

          opts.on("-R", "--rackup FILE", "Load an alternate Rack config " \
                  "file (default is config/rack.rb)") do |rackup|
            options[:rackup] = rackup
          end

          opts.on("-i", "--irb-console", "This flag will start merb in " \
                  "irb console mode. All your models and other classes will " \
                  "be available for you in an irb session.") do |console|
            options[:adapter] = 'irb'
          end

          opts.on("-S", "--sandbox", "This flag will enable a sandboxed irb " \
                  "console. If your ORM supports transactions, all edits will " \
                  "be rolled back on exit.") do |sandbox|
            options[:sandbox] = true
          end

          opts.on("-l", "--log-level LEVEL", "Log levels can be set to any of " \
                  "these options: debug < info < warn < error < " \
                  "fatal (default is info)") do |log_level|
            options[:log_level] = log_level.to_sym
            options[:force_logging] = true
          end

          opts.on("-L", "--log LOGFILE", "A string representing the logfile to " \
                  "use. Defaults to [Merb.root]/log/merb.[main].log for the " \
                  "master process and [Merb.root]/log/merb[port number].log" \
                  "for worker processes") do |log_file|
            options[:log_file] = log_file
            options[:force_logging] = true
          end

          opts.on("-e", "--environment STRING", "Environment to run Merb " \
                  "under [development, production, testing] " \
                  "(default is development)") do |env|
            options[:environment] = env
          end

          opts.on("-r", "--script-runner ['RUBY CODE'| FULL_SCRIPT_PATH]",
                  "Command-line option to run scripts and/or code in the " \
                  "merb app.") do |code_or_file|
            options[:runner_code] = code_or_file
            options[:adapter] = 'runner'
          end

          opts.on("-K", "--graceful PORT or all", "Gracefully kill one " \
                  "merb proceses by port number.  Use merb -K all to " \
                  "gracefully kill all merbs.") do |ports|
            options[:action] = :kill
            ports = "main" if ports == "all"
            options[:port] = ports
          end

          opts.on("-k", "--kill PORT", "Force kill one merb worker " \
                  "by port number. This will cause the worker to" \
                  "be respawned. If you want to kill ") do |port|
            options[:action] = :kill_9
            port = "main" if port == "all"
            options[:port] = port
          end
          
          opts.on("--fast-deploy", "Reload the code, but not your" \
            "init.rb or gems") do
              options[:action] = :fast_deploy
          end

          # @todo Do we really need this flag? It seems unlikely to want to
          #   change the mutex from the command-line.
          opts.on("-X", "--mutex on/off", "This flag is for turning the " \
                  "mutex lock on and off.") do |mutex|
            if mutex == "off"
              options[:use_mutex] = false
            else
              options[:use_mutex] = true
            end
          end

          opts.on("-D", "--debugger", "Run merb using rDebug.") do
            begin
              require "ruby-debug"
              Debugger.start
              if Debugger.respond_to?(:settings)
                Debugger.settings[:autoeval] = true
              end
              puts "Debugger enabled"
            rescue LoadError
              puts "You need to install ruby-debug to run the server in " \
                "debugging mode. With gems, use `gem install ruby-debug'"
              exit
            end
          end

          opts.on("-V", "--verbose", "Print extra information") do
            options[:verbose] = true
          end

          opts.on("-C", "--console-trap", "Enter an irb console on ^C") do
            options[:console_trap] = true
          end

          opts.on("-?", "-H", "--help", "Show this help message") do
            puts opts
            exit
          end
        end

        # Parse what we have on the command line
        begin
          opts.parse!(argv)
        rescue OptionParser::InvalidOption => e
          Merb.fatal! e.message, e
        end
        Merb::Config.setup(options)
      end

      attr_accessor :configuration

      # Set configuration parameters from a code block, where each method
      # evaluates to a config parameter.
      #
      # ==== Parameters
      # &block:: Configuration parameter block.
      #
      # ==== Examples
      #   # Set environment and log level.
      #   Merb::Config.configure do
      #     environment "development"
      #     log_level   "debug"
      #   end
      def configure(&block)
        ConfigBlock.new(self, &block) if block_given?
      end

      # Allows retrieval of single key config values via Merb.config.<key>
      # Allows single key assignment via Merb.config.<key> = ...
      #
      # ==== Parameters
      # method<~to_s>:: Method name as hash key value.
      # *args:: Value to set the configuration parameter to.
      def method_missing(method, *args)
        if method.to_s[-1,1] == '='
          @configuration[method.to_s.tr('=','').to_sym] = *args
        else
          @configuration[method]
        end
      end

    end # class << self

    class ConfigBlock

      def initialize(klass, &block)
        @klass = klass
        instance_eval(&block)
      end

      def method_missing(method, *args)
        @klass[method] = *args
      end

    end # class Configurator

  end # Config

end # Merb
