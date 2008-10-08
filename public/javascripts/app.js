function _parseInt(str) {
  return parseInt(str.replace(/[a-z-_]*/, ''));
}

jQuery(function(_){

  var spinner = _('<div class="spinner"><img src="/images/spin.gif" /></div>')

  _.fn.extend({
    friend: function() {
      return this.parents('.friend:first');
    }
    
    ,ar_id: function() {
      return _parseInt(this.attr('id'));
    }
    
    ,href: function() {
      return this.attr('href');
    }
    
    ,hide_and_remove: function() {
      return this.hide(function() {
        _(this).remove();
      })
    }
    
    ,spin: function() {
      var spin = spinner.clone();
      return this.wrap(spin).data('spin', spin);;
    }
    
    ,in_document: function() {
      return this.parents(':last').is('html');
    }
    
    ,unspin: function() {
      var wrap = this.data('spin');
      console.log(this, wrap)
      if(this.in_document()) wrap.before(this);
      wrap.hide_and_remove();
      return this;
    }
    
    ,create: function(opts) {
      return this.click(function(e) {
        e.preventDefault();
        var a = _(e.target);
        return _.ajax({
          url: a.href()
          ,contentType: 'application/json'
          ,dataType: 'json'
          ,type: 'post'
          ,data: JSON.stringify(opts.data(a, e))
          ,success: opts.success || function(data) {
            console.dir(data);
            a
              .unbind('click')
              .attr('href', '#');
          }
          ,error: opts.error || function(xhr) {
            _('html').html(xhr.responseText);
          }
          ,complete: function() {
            a.unspin();
          }
          ,beforeSend: function() {
            a.spin();
          }
        });
      });
    }
  });

  _('a.follows').create({
    data: function(a,e) {
      return {
        follow: {
          follower_id: current_user.id
          ,following_id: a.friend().ar_id()
        }
      };
    }
  });
  
});


