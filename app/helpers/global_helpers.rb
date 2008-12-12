module Merb
  module GlobalHelpers
    def required_field label, klass=nil, type='text_field', options={}, &blk
      if options.has_key? :class
        options[:class] += ' required'
      else
        options[:class] = 'required'
      end
      field label, klass, type, options, &blk
    end
  
    def field label, klass=nil, type='text_field', options={}, &blk
      markup = %{
<div class="field_wrap #{options[:class]}">
  <div class="#{klass}">
    <label for="#{klass}">
      #{label}
      <em>
        #{"(required)" if options[:class] && options[:class].match(/required/)}
      </em>
    </label>}
      field = send type, klass, options unless klass.nil?
%{
#{markup}
    #{field}
    #{capture(&blk) if block_given?}
  </div>
</div>
}
    end
  
    def faux_put
      hidden_field :_method, :value => :PUT
    end
    
    def faux_delete
      hidden_field :_method, :value => :DELETE
    end
  
    def utf8
      %{<meta http-equiv="content-type" content="text/html; charset=utf-8" />}
    end 
    
    def stylesheet
      %{<link rel="stylesheet" href="/stylesheets/compiled/master.css?#{rand}" type="text/css" media="screen" charset="utf-8" />}
    end
    
    def favicon
      %{<link href='/favicon.ico' rel='shortcut favicon icon' />}
    end
    
    def javascript
      %{<script type="text/javascript" src="/javascripts/jquery.js"></script>
        <script type="text/javascript" src="/javascripts/application.js"></script>}
    end
    
    def favideo
      %{<script type="text/javascript" src="/FAVideo.js"></script>
        <script type="text/javascript" src="/AC_RunActiveContent.js"></script>}
    end
    
    def submit text
      "<button type='submit'>#{text}</button>"
    end
    
    def link_out text, href
      link_to text, href, :target => :_blank
    end
  end
end
