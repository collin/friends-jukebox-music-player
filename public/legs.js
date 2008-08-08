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
    
    // Thanks http://github.com/Bluebie for the tip
    // about making sure a full message has been
    // send down the wire!
    var in_buffer = "";
    socket.onread = function(new_data) {
      in_buffer = in_buffer + new_data;
      splitted = in_buffer.split("\n", 2);
      if (splitted.length == 1) {
        return;
      } else {
        message = splitted[0]; in_buffer = splitted[1];
        rpc = JSON.parse(message);
        if(remoteMethods[rpc.method]) remoteMethods[rpc.method].apply(null, rpc.params);
      }
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