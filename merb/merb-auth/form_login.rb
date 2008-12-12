class Merb::Authentication
  module Strategies
    class FormLogin < Strategy
      def run!
        Merb::Authentication.user_class.authenticate(
          params[:email],
          params[:password]
        )
      end 

      def strategy_error_message
        "There is no user with that email and password."
      end
    end
  end
end
