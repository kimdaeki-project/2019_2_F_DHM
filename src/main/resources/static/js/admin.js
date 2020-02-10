/**
 * 
 */

$("#close").click(function() {
	$(".adm-left").css("width","5%");
	$(".adm-right").css("width","95%");
	$(this).css("display","none");
	$("#open").css("display","block");
});

$("#open").click(function() {
	$(".adm-left").css("width","25%");
	$(".adm-right").css("width","75%");
	$(this).css("display","none");
	$("#close").css("display","block");
});

$(".adm-left-menu").click(function() {
	$(".adm-left-menu").css("font-size","20px");
	$(this).css("font-size","30px");
});
/////////////구글 차트


var chart;
var id;
var arName;
for (var i = 0; i < 4; i++) {
	var baks = [];
	baks.push('[ \'Task\', \'Hours per Day\']');
	$(".pie-bak"+i).each(function() {
		baks.push('['+$(this).prop("id")+', '+$(this).val()+']');
	});
	
	arName = $("#arName"+i).val();
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {

		 var data = google.visualization.arrayToDataTable([
	          ['Task', 'Hours per Day'],
	          ['Work',     11],
	          ['Eat',      2],
	          ['Commute',  2],
	          ['Watch TV', 2],
	          ['Sleep',    7]
	        ]);

		  var options = {
		    title: arName+"의 숙박"
		  };
		  chart = new google.visualization.PieChart(document.getElementById('A2'));
		  chart.draw(data, options);
		}
	
	
	var transfer = [];
	transfer.push('[ \'Task\', \'Hours per Day\']');
	$(".pie-transfer"+i).each(function() {
		transfer.push('['+$(this).prop("id")+', '+$(this).val()+']');
	});
	
	google.charts.load('current', {'packages':['corechart']});	
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {

		  var data = google.visualization.arrayToDataTable([transfer]);

		  var options = {
		    title: arName+"의 교통수단"
		  };
		  chart = new google.visualization.PieChart(document.getElementById('B3'));
		  chart.draw(data, options);
		}
	

	
}









/////////////구글 차트