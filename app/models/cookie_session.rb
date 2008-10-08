module Merb 
  class CookieSession < SessionContainer
    class SessionErrors
      def initialize(session)
        @session = session
        @errors = {}
      end
      
      def inspect
        @errors.inspect
      end
     
      def add attribute, message
        (@errors[attribute] ||=[]) << message
      end
      
      def empty?
        @errors.empty?
      end
      
      def on attribute
        empty?
      end
      
      def full_messages
        return nil if empty?
        msgs = []
        @errors.each do |key, value|
          msgs += value
        end
        msgs
      end
    end
    
    attr_accessor :email, :password
    
    def errors
      @errors ||= SessionErrors.new(self)
    end
  end
end
