var tripwith = 0;
$("#tripwith").click(function () {
	if (tripwith%2!=1) {		
		$("#mkp-left-tripwith").css("display","block");	
	}else{
		$("#mkp-left-tripwith").css("display","none");
	}
	tripwith++;
});


function selectTripImgs(a, b, twith) {
	$("#tripwith_img").prop("src","/imgs/tripwith/TW_"+a+"_"+b+".png");
	$("#tripwith_txt").text(twith);
	$("#mkp-left-tripwith").css("display","none");
	tripwith = 0;
}

$("#thedate").datepicker({
//	dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
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

$(".ifm-closer").click(function() {
	$(this).parent().parent().parent().prop("class","open-ifm");
	$(this).parent().parent().css("display","none");
});


$(".mkp-city-list").on("click",".city-del", function() {
	if (confirm("일정을 취소하시겠습니까?")) {
		$(this).parent().parent().parent().remove();
		var i = 1;
		$(".mkp-city-info").each(function() {
			$(this).prop("id", "c"+i);
			i++;
		});
		count = i;
		uptDate();
	}
	
});

$(".city-selOne").click(function() {
	$(".city-btn-info-sel").prop("class","city-btn-info");
	$(this).next().prop("class","city-btn-info-sel");
	$(".city-btn-info").slideUp("past");
	$(this).next().slideToggle("fast");
});

/////////도시추가 스크립트
var count = 1;
$(".mkp-ajax").click(function() {
	if (confirm("일정을 추가 하시겠습니까?")) {
		
		var cityName = $(this).parent().prev().val();
		var startDate = today;
		var cDay = new Date();
		var day = 1000*60*60*24*count;
		day = cDay.getTime() + day;
		cDay.setTime(day);
		cDay = new Date(cDay).toISOString().substr(5, 6).replace('T', ' ');
		var endDate = cDay;
		
		
		$.ajax({
			type : "GET",
			url		: "addPlanner",
			data	: {
				cityName : cityName,
				startDate : startDate,
				endDate	: endDate,
				count : count
				
			},
			success	: function(d) {
				$(".mkp-city-list").append(d);
				count++;
				uptDate();
			}
		});
	}
	
	
});


//$("#testBtn").click(function () {
//	var setDay = new Date(today).toISOString().substr(5, 6).replace('T', ' ');
//	var calDay = new Date();
//	for (var i = 1; i < count; i++) {
//		var bak = $("#c"+i+"  .nights-day").text()*1;
//		$("#c"+i+" .sDate").text(setDay);
//		calDay = new Date(setDay);
//		var day = 1000*60*60*24*bak;
//		console.log("bak = "+bak);
//		console.log("day = "+day);
//		day = calDay.getTime() + day;
//		calDay.setTime(day);
//		calDay = new Date(setDay).toISOString().substr(5, 6).replace('T', ' ');
//		$("#c"+i+" .eDate").text(calDay);
//		setDay = calDay;
//	}
//});

function uptDate() {
	var setDay = new Date(today);
	console.log(setDay);
	var setDay2 = new Date(today).toISOString().substr(5, 6).replace('T', ' ');
	for (var i = 1; i < count; i++) {
		$("#c"+i+" .sDate").text(setDay2);
		var bak = $("#c"+i+"  .nights-day").text()*1;
		setDay.setDate(setDay.getDate()+bak);
		console.log(setDay);
		var calDay = new Date(setDay).toISOString().substr(5, 6).replace('T', ' ');
		$("#c"+i+" .eDate").text(calDay);
		setDay2 = calDay;
	}
	
}



function showModal(cName,sid) {
	$(".chos-cityName").text(cName);
	$(".chos-sleep").css("display","block");
	$(".chos-sleep-opt").prop("name","setSleep("+sid+")");
}

function closeSleep() {
	$(".chos-sleep").css("display","none");
}























