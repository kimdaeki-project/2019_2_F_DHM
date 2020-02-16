


var pp = new Array();



var container = document.getElementById('map'); 
var options = { 
      center: new kakao.maps.LatLng(36.604638908843044, 128.0525083125467),
      level: 14 
};

var map = new kakao.maps.Map(container, options); 
var control = new kakao.maps.ZoomControl();
var i = 1;
$(".pp-index").each(function() {
   
   var overlay = new kakao.maps.CustomOverlay({
          clickable: true,
          content: '<div class="roundNumber"> ' + i + '</div>',
          map: map,
          position: positions[$(this).text()*1].latlng,
          yAnchor:1,
       });
   i++;
   pp.push(positions[$(this).text()*1].latlng);
});

 
var polyline = new kakao.maps.Polyline({
   map: map, 
   path:pp,
   endArrow: true, 
   strokeWeight: 4, 
   strokeColor: 'green',
   strokeOpacity: 0.9, 
   strokeStyle: 'solid' 
});

