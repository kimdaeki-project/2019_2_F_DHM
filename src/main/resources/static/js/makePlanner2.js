
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
         $(this).css("background-color","#18A8F1");
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
var pose = $("#purpose").val();

$(".mkp-right").on("click",".mkp-ajax", function() {

	
	var url = "addPlanner";
	if (pose > 8) {
		url = "../planner/addPlanner";
	}
	

   

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
         url      : url,
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
   var arCode = $(this).parent().prop("title")*1;
   $.ajax({
      type : "GET",
      url : "getPercent",
      data : {
         arCode : arCode 
      },
      success : function(d) {
         var pc = 0;
         
         $(".chos-sleep-per").each(function() {
            $(this).text(d[pc]+"%");
            console.log(pc);
            pc++;
         });
      }
   });
   
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

var titleA = [];
var firstimageA = [];
var addr1A = [];
var arCodeA = [];


function saveSch(t, f, a, c) {

   
      titleA.push(t);
      firstimageA.push(f);
      addr1A.push(a);
      arCodeA.push(c);      

   
}

function spliceSch(t,f,a,c){
	
	titleA.splice(titleA.indexOf(t),1);
	firstimageA.splice(firstimageA.indexOf(f),1);
	addr1A.splice(addr1A.indexOf(a),1);
	acCodeA.splice(arCodeA.indexOf(c),1);
	
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

var deDate = [];
var arDate = [];
var bak = [];
var region = [];
var transfer = [];
var polyIndex = [];
var arCodeP = [];


$(".mkp-clp-btn").click(function() {
   jQuery.ajaxSettings.traditional = true;
  
   
   if (confirm("저장하시겠습니까?")) {
      var id = $("#member-id").val();
      var title=$("#mkp-title").val();
      var type=$("#tripwith_txt").text();
      var people=$("#mkp-people").val();
      var email=$("#mkp-email").val();
      var unlock = $("#mkp-unlock").val();
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
      
      if (pose < 9) {

      
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
               email : email,
               plLock : unlock
            },
            success   : function(d) {
               alert("저장되었습니다.");
               location.href = "../schedule/schedulePage?plNum="+d;
            }
            
            
         });
   }else{
   
      var price = $("#mkp-price").val();
      var goal = $("#mkp-goal").val();
      var start = $("#mkp-start").val();
      var end = $("#mkp-end").val();
      var time1 = $("#mkp-time1").val();
      var time2 = $("#mkp-time2").val();
      var contents = $("#mkp-contents").val();
      
   
       $.ajax({
        type   : "POST",
        url      : "fundingPlanner",
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
           email : email,
           price : price,
           goal : goal,
           start : start,
           end : end,
           time1 : time1,
           time2 : time2,
           contents : contents
           
        },
        success   : function(d) {
           alert("저장되었습니다.");
           location.href = "../funding/myFundingList?plNum="+d;
        }
        
        
     });

   }
      
   }
});

///////////////////////////////////////////카카오맵//////////////////////////////////////

var container = document.getElementById('map'); 
var options = { 
   center: new kakao.maps.LatLng(35.604638908843044, 128.0525083125467), 
   level: 12 
};

var map = new kakao.maps.Map(container, options); 
map.setMaxLevel(13);
var control = new kakao.maps.ZoomControl();
map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT);

var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i++) {
    var imageSize = new kakao.maps.Size(24, 35); 

    
    var overlay = new kakao.maps.CustomOverlay({
       clickable: true,
       content: content[i].city,
       map: map,
       position: positions[i].latlng,
       yAnchor:1,
    });


   function closeOverlay() {
       overlay.setMap(null);     
   }
}

var polyline = new kakao.maps.Polyline({
   map: map,
   endArrow: true, 
   strokeWeight: 4, 
   strokeColor: 'green', 
   strokeOpacity: 0.9, 
   strokeStyle: 'solid'
});

var pp;
   
function makePoly(ps) {
   
    pp = [];
   for (var i = 0; i < ps.length; i++) {
      pp.push(positions[ps[i]].latlng);
      
   }
   
   
   if (pp.length>1) {
      
      polyline.setPath(pp);
   }
   
}
   

function uptPoly() {
   
   pIndex = [];
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
   

var mapCenter;
var mapLevel;

function displayMarker() {
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


$(".fund-table").change(function() {
	var x = ($("mkp-goal").val()*1) / ($("#mkp-people").val()*1);
	$("#mkp-price").prop("value",x);
});





