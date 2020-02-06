
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
	   
	   displayMarker();
	   
      map.setLevel(14);
      map.setCenter(new kakao.maps.LatLng(35.954638908843044, 128.6525083125467));
      var chn = $(this).parent().parent().parent().prop("id").substr(1);
      
      $(".city-selOne").each(function() {
         if (chn == $(this).text().trim()) {
         var ctx = '&nbsp;'+$(this).val()+'&nbsp;';
         $(this).html(ctx);
         $(this).css("background-color","#3ad195");
         $(this).prop("name","");
      }
   });
      
      
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
      setNumber(false);
      
      map.setLevel(mapLevel);
      
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

var zindex = 1;
$(".mkp-right").on("click",".city-selOne", function() {
   $(".city-btn-info-sel").prop("class","city-btn-info");
   $(this).next().prop("class","city-btn-info-sel");
   $(".city-btn-info").slideUp("fast");
   $(this).next().slideToggle("fast");
   $(this).parent().parent().css("z-index",zindex);
   zindex++;
});

/////////도시추가 스크립트
var count = 1;
var totalBak = 1;
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
         url      : "addPlanner",
         data   : {
            cityName : cityName,
            startDate : startDate,
            endDate   : endDate,
            count : count,
            arCode : arCode,
            index : index
            
         },
         success   : function(d) {
            $(".mkp-city-list").append(d);
            count++;
            uptDate();
            makePoly(pIndex);
            $(".city-btn-info-sel").slideUp("fast");
            setNumber(true);
            totalBak++;
         }
      });
   }
});



function uptDate() {
   totalBak = 1;
   var setDay = new Date(today);
   var setDay2 = new Date(today).toISOString().substr(0, 10).replace('T', ' ');
   for (var i = 1; i < count; i++) {
      $("#c"+i+" .sDate").text(setDay2);
      var bak = $("#c"+i+"  .nights-day").text()*1;
      if ($("#c"+i+"  .nights-day").text().trim() == "무") {
         bak = 0;
      }
      totalBak+=bak;
      setDay.setDate(setDay.getDate()+bak);
      var calDay = new Date(setDay).toISOString().substr(0, 10).replace('T', ' ');
      $("#c"+i+" .eDate").text(calDay);
      setDay2 = calDay;
   }
   
   $("#totalBak").text(totalBak+"일");
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
            setNumber(false);
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
      }else if(i == 2){
         $("#c"+i).prev().remove();
         $("#c"+i).before(ti);
      }else if (i > 2) {
      if (!$("#c"+i).prev().hasClass("mkp-trans-info")) {
         $("#c"+i).before(ti);   
      }
   }
   }
}


function setNumber(move) {
	mapCenter = map.getCenter();
	mapLevel = map.getLevel();
	map.setMaxLevel(14);
	map.setLevel(14);
   var cn = 1;
   $(".city-sel-name").each(function() {
      var comp = $(this).text();
      $(".city-selOne").each(function() {
         if ($(this).val()==comp) {
            var ct = '<font style="font-size:18px; font-weigth:bolder;">&nbsp;'+cn+
            '&nbsp;</font>';
            $(this).html(ct);
            cn++;
            $(this).prop("name",7);
            $(this).css("background-color","red");
         }
      });
   });
   map.setLevel(mapLevel);
   map.setMaxLevel(13);
   
   if (move) {
	   map.panTo(positions[$("#c"+(cn-1)).prop("title")].latlng);	
}
   
}






/////////////////////////////////////////////////////
//헤현

var titleA = new Array();
var firstimageA = new Array();
var addr1A = new Array();
var arCodeA = new Array();

function saveSch(t, f, a, c) {
	for (var i = 0; i < t.length; i++) {
		titleA.push(t[i]);
		firstimageA.push(f[i]);
		addr1A.push(a[i]);
		arCodeA.push(c[i]);		
	}
}
/////////////////////////////////////////////////////


function openComplete() {
   if (count > 1) {      
      $(".mkp-complete").slideDown("fast");
      $(".city-selOne").each(function() {
         if ($(this).prop("name")=="") {
            $(this).parent().css("visibility","hidden");
         }
      });
   }else{
      alert("일정을 추가해주세염!");
   }
}


function closeComplete() {
   $(".mkp-complete").slideUp("fast");
   $(".city-btn").css("visibility","visible");
}

var deDate = new Array();
var arDate = new Array();
var bak = new Array();
var region = new Array();
var transfer = new Array();
var polyIndex = new Array();
var arCodeP = new Array();


$(".mkp-clp-btn").click(function() {
   jQuery.ajaxSettings.traditional = true;
  
   
   if (confirm("저장하시겠습니까?")) {
      var id = $("#member-id").val();
      var title=$("#mkp-title").val();
      var type=$("#tripwith_txt").text();
      var people=$("#mkp-people").val();
      var email=$("#mkp-email").val();
      for (var i = 0; i < count-1; i++) {
         deDate.push($(".sDate")[i].innerText);
         arDate.push($(".eDate")[i].innerText);
         bak.push($(".nights-day")[i].innerText);
         region.push($(".city-sel-name")[i].innerText);
         if (i < count-2) {
            transfer.push($(".mkp-trans-chos")[i].innerText.trim());
         }
      }
      
      $(".mkp-city-info").each(function() {
		polyIndex.push($(this).prop("title"));
      });
      
      $(".mkp-city-one").each(function() {
		arCodeP.push($(this).prop("title"));
      });
       var plNum = null;
      if ($(".mkp-clp-btn").prop("name")=="update") {
    	  plNum= $("#update-plNum").val();
      }
      
      $.ajax({
         type   : "POST",
         url      : "makePlanner",
         data   : {
        	plNum : plNum,
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
           arCode:arCodeA,
           pp : polyIndex,
           arCodeP: arCodeP,
           email : email
         },
         success   : function(d) {
               alert("저장되었습니다.");
               location.href = "../schedule/schedulePage?plNum="+d;
            }
         
         
      });
   }
});

///////////////////////////////////////////카카오맵//////////////////////////////////////

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
   center: new kakao.maps.LatLng(35.604638908843044, 128.0525083125467), //지도의 중심좌표.
   level: 12 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
map.setMaxLevel(13);
//컨트롤러
var control = new kakao.maps.ZoomControl();
map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT);




// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
     
    
    // 마커를 생성합니다
//    var marker = new kakao.maps.Marker({
//        //map: map, // 마커를 표시할 지도
//        position: positions[i].latlng, // 마커를 표시할 위치
//        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//     
//    });
    
    var overlay = new kakao.maps.CustomOverlay({
       clickable: true,
       content: content[i].city,
       map: map,
       position: positions[i].latlng,
       yAnchor:1,
    });

   //marker.setMap(map);


   // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
//   kakao.maps.event.addListener(marker, 'click', function() {
//       overlay.setMap(map);
//   });

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

var pp;
   
function makePoly(ps) {
	
    pp = new Array();
   for (var i = 0; i < ps.length; i++) {
      pp.push(positions[ps[i]].latlng);
      
   }
   
   
   if (pp.length>1) {
      
      polyline.setPath(pp);
   }
   
}
   

function uptPoly() {
   
   pIndex = new Array();
   $(".mkp-city-info").each(function() {
      pIndex.push($(this).prop("title"));
   });
   
   
   pp = new Array();
   
   for (var i = 0; i < pIndex.length; i++) {
      pp.push(positions[pIndex[i]].latlng);
   }
   
   if (pp.length>1) {
   

      polyline.setPath(pp);
      
   }else if(pp.length==1){
      
      polyline.setPath(null);
   }
}

function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
        polyline.setOptions({
            strokeColor: 'green'
        });
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
        polyline.setOptions({
            strokeColor: 'yellow'
        });
    }
}
   

//kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

var mapCenter;
var mapLevel;

function displayMarker() {
    
    // 마커의 위치를 지도중심으로 설정합니다 
  mapCenter = map.getCenter();
  mapLevel = map.getLevel();
  
}
   
///////////////////////////////////////////카카오맵//////////////////////////////////////

$(".mkp-city-list").on("click",".ifm-info", function() {
	var arC = $(this).prop("title");
	
	if ($(this).next().children("iframe").prop("src") == "http://localhost/planner/waitAminute") {
		$(this).next().children("iframe").prop("src","http://localhost/planner/ifmOpen?arCode="+arC);
	}
});



















