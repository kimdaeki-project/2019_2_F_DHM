var tripwith = 0;
$("#tripwith").click(function () {
	if (tripwith%2!=1) {		
		$("#sch-left-tripwith").css("display","block");	
	}else{
		$("#sch-left-tripwith").css("display","none");
	}
	tripwith++;
});


function selectTripImgs(a, b, twith) {
	$("#tripwith_img").prop("src","/imgs/tripwith/TW_"+a+"_"+b+".png");
	$("#tripwith_txt").text(twith);
	$("#sch-left-tripwith").css("display","none");
	tripwith = 0;
}

$("#thedate").datepicker();
$("#thedate").datepicker( "option", "dateFormat", "yy-mm-dd" );
var today = new Date().toISOString().substr(0, 10).replace('T', ' ');
$("#thedate").prop("value", today);
$("#thedate").change(function() {
	today = $(this).val();
});


$(".sch-city-list").on("click",".ifm-info", function() {
	
//});
//$(".ifm-info").click(function () {
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


$(".sch-city-list").on("click",".city-del", function() {
	if (confirm("일정을 취소하시겠습니까?")) {
		$(this).parent().parent().parent().remove();
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
$(".sch-ajax").click(function() {
	if (confirm("일정을 추가 하시겠습니까?")) {
		
		var cityName = $(this).parent().prev().val();
		var startDate = today;
		today = new Date();
		var day = 1000*60*60*24*count;
		count++;
		day = today.getTime() + day;
		today.setTime(day);
		today = new Date(today).toISOString().substr(5, 6).replace('T', ' ');
		var endDate = today;
		
		
		$.ajax({
			type : "GET",
			url		: "addSchedule",
			data	: {
				cityName : cityName,
				startDate : startDate,
				endDate	: endDate
			},
			success	: function(d) {
				$(".sch-city-list").append(d);
			}
		});
	}
});


$(".sch-city-list").on("click",






























