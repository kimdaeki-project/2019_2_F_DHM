<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대동여행지도</title>
<c:import url="../template/boot.jsp" />
<c:import url="../template/summernote.jsp" />
</head>
<body>
	<div class="container">
		<h1>Funding Update Form</h1>
		
		<c:import url="../template/fundingUpdateForm.jsp" />	
		
	
	</div>
	<script type="text/javascript" src="../js/summernote.js" ></script>
	<script type="text/javascript">
	var startTime = '${vo.startTime}';
	var start = startTime.substring(0, 10);
	var time1 = startTime.substring(11, 19);

	var endTime = '${vo.endTime}';
	var end = endTime.substring(0, 10);
	var time2 = endTime.substring(11, 19);

	document.getElementById('start').value = start;
	document.getElementById('time1').value = time1;
	document.getElementById('end').value = end;
	document.getElementById('time2').value = time2;
	</script>
</body>
</html>