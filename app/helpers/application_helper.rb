module Merb
  module ApplicationHelper
    def link_to href, text, attrs={}
      attr_string = attrs.map do |key,val|
        "#{key}=\"#{val}\""
      end.join(' ')
      
      "<a href=\"#{href}\" #{attr_string}>#{text}</a>"
    end
  end
end # Merb
