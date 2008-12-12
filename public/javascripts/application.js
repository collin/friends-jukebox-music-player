// Common JavaScript code across your application goes here.
jQuery(function(_){
  var player = new FAVideo("player"
    ,null
    ,1 ,1 // width x height
    ,{
    autoLoad: false
    ,autoPlay: true
    ,skinVisible: false
    ,clickToTogglePlay: false
    ,bufferTime: 3
    ,playheadUpdateInterval: 500
    ,videoAlign: "center"
    ,volume: 50
    ,videoScaleMode: "maintainAspectRatio"
  });

});
