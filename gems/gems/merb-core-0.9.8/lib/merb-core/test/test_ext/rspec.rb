require 'spec'
module Kernel
  def given(*args, &example_group_block)
    args << {} unless Hash === args.last
    params = args.last
    
    params[:shared] = true
    
    describe(*args) do
      before(:each) do
        self.instance_eval(&example_group_block)
      end
    end
  end  
end

module Spec
  module Matchers
    def fail
      raise_error(Spec::Expectations::ExpectationNotMetError)
    end

    def fail_with(message)
      raise_error(Spec::Expectations::ExpectationNotMetError, message)
    end
  end
end

module Merb
  module Test
    def self.add_helpers(&block)
      if Merb.test_framework == :rspec
        ExampleGroup.class_eval(&block)
      else
        raise NotImplementedError
      end
    end

    class ExampleGroup < Spec::Example::ExampleGroup

      include ::Merb::Test::ViewHelper
      include ::Merb::Test::RouteHelper
      include ::Merb::Test::ControllerHelper

      def initialize(defined_description, &implementation)
        @_defined_description = defined_description
        @_implementation = implementation
      end

      class << self
        # This is a copy of the method in rspec, so we can have
        # describe "...", :when => "logged in", and the like
        def describe(*args, &example_group_block)
          args << {} unless Hash === args.last
          if example_group_block
            params = args.last
            params[:spec_path] = eval("caller(0)[1]", example_group_block) unless params[:spec_path]
            if params[:shared]
              ::Spec::Example::SharedExampleGroup.new(*args, &example_group_block)
            else
              self.subclass("Subclass") do
                describe(*args)
                if params[:when] || (params[:when] = params[:given])
                  module_eval %{it_should_behave_like "#{params[:when]}"}
                end
                module_eval(&example_group_block)
              end
            end
          else
            set_description(*args)
            before_eval
            self
          end
        end
        alias context describe

        def given(*args, &example_group_block)
          args << {} unless Hash === args.last
          params = args.last
          
          params[:shared] = true
          
          describe(*args, &example_group_block)
        end
      end

      ::Spec::Example::ExampleGroupFactory.default(self)
    end
  end
end

module Spec
  module Matchers
  
    def self.create(*names, &block)
      @guid ||= 0
      mod = Module.new do
        klass = Class.new(MatcherDSL) do
          def initialize(expected_value)
            @expected_value = expected_value
          end          
        end
        klass.class_eval(&block)
        
        names.each do |name|
          define_method(name) do |*expected_value|
            # Avoid a warning for the form should foo.
            klass.new(expected_value && expected_value[0])
          end
        end
      end
      Merb::Test::ExampleGroup.send(:include, mod)
    end
  
    class MatcherDSL
      include Merb::Test::RouteHelper
      
      def self.matches(&block)
        define_method(:matches_proxy, &block)
        
        define_method(:matches?) do |object|
          @object = object
          if block.arity == 2
            matches_proxy(@object, @expected_value)
          else
            matches_proxy(@object)
          end
        end
      end
      
      def self.expected_value(&block)
        define_method(:transform_expected, &block)
        
        define_method(:initialize) do |expected_value|
          @expected_value = transform_expected(expected_value) || expected_value
        end
      end
      
      def self.negative_failure_message(&block)
        define_method(:proxy_negative_failure_message, &block)
        
        define_method(:negative_failure_message) do
          proxy_negative_failure_message(@object, @expected_value)
        end
      end

      def self.failure_message(&block)
        define_method(:proxy_failure_message, &block)
        
        define_method(:failure_message) do
          proxy_failure_message(@object, @expected_value)
        end
      end
      
      def self.message(&block)
        class_eval do
          def failure_message
            generic_message(@object, @expected_value, nil)
          end
          
          def negative_failure_message
            generic_message(@object, @expected_value, " not")
          end
        end
        
        define_method(:proxy_generic_message, &block)

        ar = block.arity
        
        define_method(:generic_message) do |object, expected, not_string|
          if ar == 3
            proxy_generic_message(not_string, object, expected)
          else
            proxy_generic_message(not_string, object)
          end
        end
      end
    end
  
  end
end
