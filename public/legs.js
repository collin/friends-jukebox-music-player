jQuery(function(){
  Legs = (function(socket){

    var remoteMethods = {
      said:  function(sayer, says) {
        var msgs = $(".chat .messages");
        msgs.prepend("<li><cite>"+sayer+"</cite><blockquote>"+says+"</blockquote></li>");
      }
      ,play: function(url) {
         window.player.play(url);
      }
    };

    var id=0;

    function do_send() {
      var method = [].shift.apply(arguments);
      [].push.call(arguments, document.cookie);
      var payload = {id:id++, method: method, params:arguments};
      socket.send(JSON.stringify(payload)+"\r\n");
    }
    
    socket.onread = function(data) {
      jQuery(data.split("\n")).each(function(i, msg) {
        rpc = JSON.parse(msg);
        if(remoteMethods[rpc.method]) remoteMethods[rpc.method].apply(null, rpc.params);
      });
    };
  
    return {
      say: function(message) {  
        do_send('say', message);
      }
      ,nextTrack: function() {
        do_send('next_track');
      }
    }
  })(new TCPSocket('localhost', '30274'));
});