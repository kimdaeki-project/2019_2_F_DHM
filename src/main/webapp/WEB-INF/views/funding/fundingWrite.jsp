<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대동여지도</title>
 
<c:import url="./template/fundingBoot.jsp" />
<c:import url="./template/summernote.jsp" />
<%-- <c:import url="./template/ckeditor.jsp" /> --%>
</head>
<body>
	<div class="container">
		<h1>Funding Write Form</h1>
		<c:import url="./template/fundingWriteForm.jsp" />	

	</div>
<script type="text/javascript" src="../js/summernote.js" ></script>
<script type="text/javascript">
	$("#re").click(function(){
		location.href= "./fundingList";
		});

/* 	window.onload = function(){
	    var dt = new Date();
	    var Year = dt.getFullYear();        
	    var Month = (dt.getMonth()+1);
	    var Day = dt.getDate();            
	    
	    if(Month.length > 1) Month = "0" + Month;
	    if(Day.length > 1) Day = "0" + Day;
	    
	    var Today = Year.toString() + "-" + Month + "-" + Day;
	    
	    document.getElementById("start").value = Today;
	}  */
	</script>

</body>
</html>