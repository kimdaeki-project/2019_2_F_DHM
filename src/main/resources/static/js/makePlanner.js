
$("#tripwith").click(function () {
   
   $("#mkp-left-tripwith").slideToggle("fast");//css("display","block");
   
});

$(".mkp-city-list").on("click",".mkp-trans-btn", function(e) {
   e.preventDefault();
   if ($(this).children("div").css("display") == "none") {
      $(".mkp-trans-picker").css("display","none");
      $(this).children("div").slideToggle("fast");
   }else{
      $(this).children("div").slideToggle("fast");
   }
} );

$(".mkp-city-list").on("click",".mkp-trans-sct", function() {
   $(this).parent().parent().children("font").html('<span class="mkp-trans-chos">'+$(this).text()+'</span>'+'<i class="fa fa-chevron-circle-down""></i>');
});

function selectTripImgs(a, b, twith) {
   $("#tripwith_img").prop("src","/imgs/tripwith/TW_"+a+"_"+b+".png");
   $("#tripwith_txt").text(twith);
   $("#mkp-left-tripwith").css("display","none");
   tripwith = 0;
}

$("#thedate").datepicker({

    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
   dayNamesMin : ['일','월','화','수','목','금','토'],
   minDate : 1
});
$("#thedate").datepicker( "option", "dateFormat", "yy-mm-dd" );
var today = new Date().toISOString().substr(0, 10).replace('T', ' ');
$("#thedate").prop("value", today);
$("#thedate").prop("min", today);
$("#thedate").change(function() {
   today = $(this).val();
   uptDate();
});




$(".mkp-city-list").on("click",".ifm-info", function() {
   if ($(this).parent().prop("class")=="open-ifm") {      
      $(".open-ifm-sel").prop("class", "open-ifm");
      $(this).parent().prop("class","open-ifm-sel");
      $(".ifm-opener").css("display","none");
      $(this).next().slideToggle("fast");
   }else{
      $(".open-ifm-sel").prop("class", "open-ifm");
      $(".ifm-opener").css("display","none");
   }
   
});

$(".mkp-city-list").on("click",".ifm-closer", function() {
   $(this).parent().parent().parent().prop("class","open-ifm");
   $(this).parent().parent().css("display","none");
});


$(".mkp-city-list").on("click",".city-del", function() {
   if (confirm("일정을 취소하시겠습니까?")) {
      $(this).parent().parent().parent().parent().remove();
      var ti = $(".mkp-trans-info-ex").html();
      ti = '<div class="mkp-trans-info">'+ti+'</div>';
      setId();
      $(".mkp-trans-info").remove();
      for (var i = 1; i < count; i++) {
         if (i != 1 ) {
            $("#c"+i).before(ti);
         }
      }
      uptPoly();
   }
   
});

function setId() {
	var i = 1;
	$(".mkp-city-info").each(function() {
		$(this).prop("id", "c"+i);
		i++;
	});
	var ct = 1;
	$(".click-sleep").each(function() {
		$(this).prop("title","c"+ct);
		ct++;
	});
	count = i;
	uptDate();
}

$(".mkp-right").on("click",".city-selOne", function() {
   $(".city-btn-info-sel").prop("class","city-btn-info");
   $(this).next().prop("class","city-btn-info-sel");
   $(".city-btn-info").slideUp("fast");
   $(this).next().slideToggle("fast");
});

/////////도시추가 스크립트
var count = 1;
var pIndex = new Array(); //위도경도 인덱스 배열

$(".mkp-right").on("click",".mkp-ajax", function() {
	if (confirm("일정을 추가 하시겠습니까?")) {
		
		var cityName = $(this).parents().prev().val();
		var startDate = today;
		var cDay = new Date();
		var day = 1000*60*60*24*count;
		day = cDay.getTime() + day;
		cDay.setTime(day);
		cDay = new Date(cDay).toISOString().substr(0, 10).replace('T', ' ');
		var endDate = cDay;
		var arCode = $(this).parents().next().val();
		pIndex.push($(this).parents().next().prop("title"));
		var index = $(this).parents().next().prop("title");
		
		$.ajax({
			type : "GET",
			url		: "addPlanner",
			data	: {
				cityName : cityName,
				startDate : startDate,
				endDate	: endDate,
				count : count,
				arCode : arCode,
				index : index
				
			},
			success	: function(d) {
				$(".mkp-city-list").append(d);
				count++;
				uptDate();
				makePoly(pIndex);
				$(".city-btn-info-sel").slideUp("fast");
			}
		});
	}
});



function uptDate() {
	var setDay = new Date(today);
	var setDay2 = new Date(today).toISOString().substr(0, 10).replace('T', ' ');
	for (var i = 1; i < count; i++) {
		$("#c"+i+" .sDate").text(setDay2);
		var bak = $("#c"+i+"  .nights-day").text()*1;
		if ($("#c"+i+"  .nights-day").text() == "무") {
			bak = 0;
		}
		setDay.setDate(setDay.getDate()+bak);
		var calDay = new Date(setDay).toISOString().substr(0, 10).replace('T', ' ');
		$("#c"+i+" .eDate").text(calDay);
		setDay2 = calDay;
	}
	

}



$("body").on("click",".click-sleep", function() {
   $(".chos-cityName").text($(this).prop("id"));
   $("#save-sleep").prop("title",$(this).prop("title"));
   $(".chos-sleep").css("display","block");
});

$(".chos-sleep-opt").click(function() {
   var id = "#"+$("#save-sleep").prop("title");
   $(id+" .nights-day").text($(this).prop("title"));
   $(".chos-sleep").css("display","none");
   uptDate();
});
   

function closeSleep() {
   $(".chos-sleep").css("display","none");
}

////////////////////////////////////////////////////////////


$(function() {
	$(".mkp-city-list").sortable({
		stop : function() {
				addTsel();
				uptPoly();
		}
	});
});




function addTsel() {
   var ti = $(".mkp-trans-info-ex").html();
   ti = '<div class="mkp-trans-info">'+ti+'</div>';
   setId();
   for (var i = 1; i < count; i++) {
      if (i == 1 ) {
         $("#c"+i).prev().remove();
      }else if(i = 2){
         $("#c"+i).prev().remove();
         $("#c"+i).before(ti);
      }
   }
}








/////////////////////////////////////////////////////
//헤현
var titleA = new Array();
var firstimageA = new Array();
var addr1A = new Array();
var arCodeA = new Array();

function saveSch(t, f, a, c) {
	titleA = t;
	firstimageA = f;
	addr1A = a;
	arCodeA = c;
	
	for (var i = 0; i < titleA.length; i++) {
		console.log("title = "+ titleA[i]);
		console.log("first = "+ firstimageA[i]);
		console.log("addr = "+ addr1A[i]);
		console.log("arCode = "+ arCodeA[i]);
		console.log(titleA.length);
	}
}

/////////////////////////////////////////////////////


function openComplete() {
   $(".mkp-complete").slideDown("fast");
}

function closeComplete() {
   $(".mkp-complete").slideUp("fast");
}

var deDate = new Array();
var arDate = new Array();
var bak = new Array();
var region = new Array();
var transfer = new Array();

var titleA = new Array();
var firstimageA = new Array();
var addr1A = new Array();
var arCodeA = new Array();

$(".mkp-clp-btn").click(function() {
   
   jQuery.ajaxSettings.traditional = true;
   
   
   if (confirm("저장하시겠습니까?")) {
      var id = $("#member-id").val();
      var title=$("#mkp-title").val();
      var type=$("#tripwith_txt").text();
      var people=$("#mkp-people").val();
      for (var i = 0; i < count-1; i++) {
         console.log($(".sDate")[i].innerText);
         deDate.push($(".sDate")[i].innerText);
         arDate.push($(".eDate")[i].innerText);
         bak.push($(".nights-day")[i].innerText);
         region.push($(".city-sel-name")[i].innerText);
         if (i < count-2) {
            console.log($(".mkp-trans-chos")[i].innerText.trim());
            transfer.push($(".mkp-trans-chos")[i].innerText.trim());
         }
      }
      $.ajax({
         type   : "POST",
         url      : "makePlanner",
         data   : {
            id       : id,
            title    : title,
            type   : type,
            people   : people,
            deDate   : deDate,
            arDate   : arDate,
            bak      : bak,
            region   : region,
            transfer   : transfer,
            titleA:titleA,
        	firstimage:firstimageA,
        	addr1:addr1A,
        	arCode:arCodeA
         },
         success   : function(d) {
               alert("저장되었습니다.");
               location.href = "scheduel/schdulePage?plNum="+d;
            }
         
         
      });
   }
});

///////////////////////////////////////////카카오맵//////////////////////////////////////

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(37.47957447150438, 127.25796704920329), //지도의 중심좌표.
	level: 10 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
map.setMaxLevel(13);
//컨트롤러
var control = new kakao.maps.ZoomControl();
map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT);


//마커를 표시할 위치와 title 객체 배열입니다

var content = [
   {
      city : '<div class="city-btn"><button value="서울" class="city-selOne">서울</button><div class="city-btn-info"><img src="../city/seoul.jpg" class="city-btn-img"><br><span class="city-btn-p1"><img alt="태극기" src="../city/flag.gif"> 서울</span><br><br><span class="city-btn-p2">대한민국 수도</span><br><button class="mkp-ajax">+</button></div><input type="hidden" value="1" title="0"></div>'
   },
   {
      city : '<div class="city-btn"><button value="인천" class="city-selOne">인천</button><div class="city-btn-info"><img src="../city/incheon.jpg" class="city-btn-img"><br><span class="city-btn-p1"><img alt="태극기" src="../city/flag.gif"> 인천</span><br><br><span class="city-btn-p2">인천 국제공항, 월미도</span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="2" title="1"></div>'
   },
   {
      city : '<div class="city-btn"><button value="대전" class="city-selOne">대전</button><div class="city-btn-info"><img src="../city/dageon.jpg" class="city-btn-img"><br><span class="city-btn-p1"><img alt="태극기" src="../city/flag.gif"> 대전</span><br><br><span class="city-btn-p2">엑스포의 도시 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="3" title="2"></div>'
   },
   {
      city : '<div class="city-btn"><button value="대구" class="city-selOne">대구</button><div class="city-btn-info"><img src="../city/daegu.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 대구</span><br><br><span class="city-btn-p2">'
         +'영남의 중심지</span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="4" title="3"></div>'
   },
   {
      city : '<div class="city-btn"><button value="광주" class="city-selOne">광주</button><div class="city-btn-info"><img src="../city/gwangju.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 광주</span><br><br><span class="city-btn-p2">'
         +'대표적인 관광지 무등산</span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="5" title="4"></div>'
   },
   {
      city : '<div class="city-btn"><button value="부산" class="city-selOne">부산</button><div class="city-btn-info"><img src="../city/busan.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 부산</span><br><br><span class="city-btn-p2">'
         +'대한민국 제일의 항구</span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="6" title="5"></div>'
   },
   {
      city : '<div class="city-btn"><button value="울산" class="city-selOne">울산</button><div class="city-btn-info"><img src="../city/ulsan.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 울산</span><br><br><span class="city-btn-p2">'
         +'울산 대게</span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="7" title="6"></div>'
   },
   {
      city : '<div class="city-btn"><button value="세종" class="city-selOne">세종</button><div class="city-btn-info"><img src="../city/sejong.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 세종시</span><br><br><span class="city-btn-p2">'
         +'Korea\'s Administration city</span><br> <button class="mkp-ajax">+</button></div><input type="hidden" title="7" value="8"></div>'
   },
   {
      city : '<div class="city-btn"><button value="경기도" class="city-selOne">경기도</button><div class="city-btn-info"><img src="../city/suwon.png" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 경기도</span><br><br><span class="city-btn-p2" style="font-size:10px;">'
         +'지하철에서 인생 20% 보내는 도민</span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="31" title="8"></div>'
   },
   {
      city : '<div class="city-btn"><button value="강원도" class="city-selOne">강원도</button><div class="city-btn-info"><img src="../city/gangwon.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 강원도</span><br><br><span class="city-btn-p2">'
         +'아이폰 감자 2박스에 삽니다 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="32" title="9"></div>'
   },
   {
      city : '<div class="city-btn"><button value="충북" class="city-selOne">충청북도</button><div class="city-btn-info"><img src="../city/cungbuk.jpeg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 충청북도</span><br><br><span class="city-btn-p2">'
         +'마법의 단어 뭐여 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="33" title="10"></div>'
   },
   {
      city : '<div class="city-btn"><button value="충남" class="city-selOne">충청남도</button><div class="city-btn-info"><img src="../city/cungnam.PNG" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 충청남도</span><br><br><span class="city-btn-p2">'
         +'됐다 그려~ </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="34" title="11"></div>'
   },
   {
      city : '<div class="city-btn"><button value="경북" class="city-selOne">경상북도</button><div class="city-btn-info"><img src="../city/gyungju.png" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 경상북도</span><br><br><span class="city-btn-p2">'
         +'첨성대, 불국사 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="35" title="12"></div>'
   },
   {
      city : '<div class="city-btn"><button value="경남" class="city-selOne">경상남도</button><div class="city-btn-info"><img src="../city/gyungnam.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 경상남도</span><br><br><span class="city-btn-p2">'
         +'이에이승 이에이승 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="36" title="13"></div>'
   },
   {
      city : '<div class="city-btn"><button value="전북" class="city-selOne">전라북도</button><div class="city-btn-info"><img src="../city/jeonbuk.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 전라북도</span><br><br><span class="city-btn-p2">'
         +'전주는 비빔밥이 제일 맛없다 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="37" title="14"></div>'
   },
   {
      city : '<div class="city-btn"><button value="전남" class="city-selOne">전라남도</button><div class="city-btn-info"><img src="../city/jeonnam.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 전라남도</span><br><br><span class="city-btn-p2">'
         +'버즈 - 겁재이 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="38" title="15"></div>'
   },
   {
      city : '<div class="city-btn"><button value="제주도" class="city-selOne">제주도</button><div class="city-btn-info"><img src="../city/jeju.jpg" class="city-btn-img"><br><span class="city-btn-p1">'
         +'<img alt="태극기" src="../city/flag.gif"> 제주도</span><br><br><span class="city-btn-p2">'
         +'바람 여자 돌이 많은 삼다도 </span><br> <button class="mkp-ajax">+</button></div><input type="hidden" value="39" title="16"></div>'
   }
];


var positions = [
    {   
        title: '서울', 
        latlng: new kakao.maps.LatLng(37.571076259872015, 126.97535701250726)
    },
    {
        title: '인천', 
        latlng: new kakao.maps.LatLng(37.39779189766989, 126.64980904134069)
    },
    {
        title: '대전', 
        latlng: new kakao.maps.LatLng(36.350539078678544, 127.38477914576099)
    },
    {
        title: '대구', 
        latlng: new kakao.maps.LatLng(35.87137692677072, 128.6017854949684)
    },
    {
        title: '광주', 
        latlng: new kakao.maps.LatLng(35.164993479221536, 126.84931603426283)
    },
    {
        title: '부산', 
        latlng: new kakao.maps.LatLng(35.18424810138255, 129.07373362504984)
    },
    {
        title: '울산', 
        latlng: new kakao.maps.LatLng(35.54150661193162, 129.34254893226594)
    },
    {
        title: '세종시', 
        latlng: new kakao.maps.LatLng(36.483318742800634, 127.28818075326797)
    },
    {
        title: '경기도', 
        latlng: new kakao.maps.LatLng(37.37957447150438, 127.45796704920329)
    },
    {
        title: '강원도', 
        latlng: new kakao.maps.LatLng(37.7491512034199, 128.2093955401731)
    },
    {
        title: '충북', 
        latlng: new kakao.maps.LatLng(36.8395004998076, 127.75869556643119)
    },
    {
        title: '충남', 
        latlng: new kakao.maps.LatLng(36.5561926870096, 126.81520527950984)
    },
    {
        title: '경북', 
        latlng: new kakao.maps.LatLng(36.483559254049446, 128.71503349320736)
    },
    {
        title: '경남', 
        latlng: new kakao.maps.LatLng(35.50410237891202, 128.46824512616237)
    },
    {
        title: '전북', 
        latlng: new kakao.maps.LatLng(35.75282257788437, 127.20480014761522)
    },
    {
        title: '전남', 
        latlng: new kakao.maps.LatLng(34.935488699960814, 126.99964973637569)
    },
    {
        title: '제주', 
        latlng: new kakao.maps.LatLng(33.38907191527383, 126.54423455680002)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
     
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        //map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
     
    });
    
    var overlay = new kakao.maps.CustomOverlay({
       clickable: true,
       content: content[i].city,
       map: map,
       position: positions[i].latlng,
       yAnchor:1,
    });

   //marker.setMap(map);


   // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
   kakao.maps.event.addListener(marker, 'click', function() {
       overlay.setMap(map);
   });

   // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
   function closeOverlay() {
       overlay.setMap(null);     
   }
}

var polyline = new kakao.maps.Polyline({
	map: map, // 선을 표시할 지도 객체
	endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다
	strokeWeight: 4, // 선의 두께
	strokeColor: 'green', // 선 색
	strokeOpacity: 0.9, // 선 투명도
	strokeStyle: 'solid' // 선 스타일
});

	
function makePoly(ps) {
	var pa = new Array();
	for (var i = 0; i < ps.length; i++) {
		pa.push(positions[ps[i]].latlng);
	}
	if (pa.length>1) {
		
//	polyline = new kakao.maps.Polyline({
//		map: map, // 선을 표시할 지도 객체
//		path:[
//			pa[pa.length-2],
//			pa[pa.length-1]
//		],
//		endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다
//		strokeWeight: 4, // 선의 두께
//		strokeColor: 'green', // 선 색
//		strokeOpacity: 0.9, // 선 투명도
//		strokeStyle: 'solid' // 선 스타일
//	});	
		polyline.setPath(pa);
	}
//	polyline.setMap(map);
}
	
var pu;

function uptPoly() {
	
	pIndex = new Array();
	$(".mkp-city-info").each(function() {
		pIndex.push($(this).prop("title"));
	});
	
	
	pu = new Array();
	
	for (var i = 0; i < pIndex.length; i++) {
		pu.push(positions[pIndex[i]].latlng);
	}
	
	if (pu.length>1) {
	
//		for (var i = 0; i < pu.length-1; i++) {
//			
//			polyline = new kakao.maps.Polyline({
//				map: map, // 선을 표시할 지도 객체
//				path:[
//						pu[i],
//						pu[i+1]
//					],
//					endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다
//					strokeWeight: 4, // 선의 두께
//					strokeColor: 'green', // 선 색
//					strokeOpacity: 0.9, // 선 투명도
//					strokeStyle: 'solid' // 선 스타일
//			});
//		}	
		polyline.setPath(pu);
	}
}




















	
	
	
///////////////////////////////////////////카카오맵//////////////////////////////////////
