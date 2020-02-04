
var pp = new Array();


	
	var container = document.getElementById('map'); 
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(35.604638908843044, 128.0525083125467),
			level: 14 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
//컨트롤러
	var control = new kakao.maps.ZoomControl();
	//map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT);
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
		map: map, // 선을 표시할 지도 객체
		path:pp,
		endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다
		strokeWeight: 4, // 선의 두께
		strokeColor: 'green', // 선 색
		strokeOpacity: 0.9, // 선 투명도
		strokeStyle: 'solid' // 선 스타일
	});
	




