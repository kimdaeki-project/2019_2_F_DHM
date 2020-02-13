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
var i =0;
var j = 0;
var datas=[];
var option = [];
var datas2=[];
var option2 = [];
var z = 0;
var d = $("#rlfdl").val()*1;
for (i = 0; i < d; i++) {
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		arName = $("#arName"+z).val();
		 var data1 = new google.visualization.DataTable();
	        data1.addColumn('string', 'Topping');
	        data1.addColumn('number', 'Slices');
	        $(".pie-bak"+z).each(function() {
	        	if ($(this).val() > 0) {					
	        		data1.addRows([[$(this).prop("id"),$(this).val()*1]]);
				}
	    	});
		 
		 datas.push(data1);
		 
		 var data2 = new google.visualization.DataTable();
	        data2.addColumn('string', 'Topping');
	        data2.addColumn('number', 'Slices');
	        $(".pie-transfer"+z).each(function() {
	        	if ($(this).val() > 0) {					
	        		data2.addRows([[$(this).prop("id"),$(this).val()*1]]);
				}
	    	});
		 
		 datas2.push(data2); 
		 
		 
		 
		  var options1 = {
		    title: arName +"의 숙박",
		    width: 310
		  };
		  
		  option.push(options1);
		  var options2 = {
			title: arName+"의 교통수단",
			width: 310
		  };
				  
		  option2.push(options2);
		  
		  
			  chart = new google.visualization.PieChart(document.getElementById('A'+z));
			  chart.draw(datas[z], option[z]);
			  chart = new google.visualization.PieChart(document.getElementById('B'+z));
			  chart.draw(datas2[z], option2[z]);
		
		  
		  
			  z++;
		}

}

$(".member-exclude").click(function() {
	if (confirm("추방하시겠습니까?")) {
		var id = $(this).val();
		$.ajax({
			type:"POST",
			url:"memberDel",
			data : {
				id : id
			},
			success : function(b) {
				if (!b) {
					location.reload();
				}else{
					alert("이미 삭제하셨습니다");
				}
				
			}
			
		});
		
	}
});






/////////////구글 차트