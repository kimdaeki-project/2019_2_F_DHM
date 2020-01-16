<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대동여지도</title>
 
<c:import url="../template/boot.jsp" />
<c:import url="../template/summernote.jsp" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

</head>
<body>
	<div class="container">
		<h1>Funding Write Form</h1>
		<c:import url="../template/fundingWriteForm.jsp" />	

	</div>
	<script type="text/javascript" src="../js/summernote.js" ></script>
	
<!-- date -->
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
	
	//date
		$("#start").datepicker({
			//   dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
			   dayNamesMin : ['일','월','화','수','목','금','토'],
			   minDate : 0
			});
			$("#start").datepicker( "option", "dateFormat", "yy-mm-dd" );
			
			$("#end").datepicker({
				//   dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
				   dayNamesMin : ['일','월','화','수','목','금','토'],
				   minDate : 1
			});
			$("#end").datepicker( "option", "dateFormat", "yy-mm-dd" );
			

			/* var rangeDate = 31; // set limit day
			var setSdate, setEdate;
			$("#start").datepicker({
			    dateFormat: 'yy-mm-dd',
			    minDate: 0,
			    onSelect: function(selectDate){
			        var stxt = selectDate.split("-");
			            stxt[1] = stxt[1] - 1;
			        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
			        var edate = new Date(stxt[0], stxt[1], stxt[2]);
			            edate.setDate(sdate.getDate() + rangeDate);
			        
			        $('#end').datepicker('option', {
			            minDate: selectDate,
			            beforeShow : function () {
			                $("#end").datepicker( "option", "maxDate", edate );                
			                setSdate = selectDate;
			                console.log(setSdate)
			        }});
			        //to 설정
			    }
			    //from 선택되었을 때
			});
			            
			$("#start").datepicker({ 
			    dateFormat: 'yy-mm-dd',
			    onSelect : function(selectDate){
			        setEdate = selectDate;
			        console.log(setEdate)
			    }
			}); */

			
			
	</script> -->
</body>
</html>