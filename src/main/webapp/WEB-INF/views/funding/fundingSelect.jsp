<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대동여행지도</title>
<c:import url="./template/fundingBoot.jsp"></c:import>

</head>
<body>
<h1>Funding Select Page</h1>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<div class="container">
	<div class="form-group">
		
		 이름<br><br>
		<span id="name">${vo.name}</span><br><br>
		내용
		<p class="excert">${ vo.contents }</p><br>
		펀딩 금액<br><span id="price"></span>원<br><br>
		펀딩 목표<br><span id="goal"></span>원<br><br>
		펀딩 시작 시간<br>
		<span id="startTime"></span>시<br><br>
		펀딩 마감 시간<br>
		<span id="endTime"></span>시<br><br>
		펀딩 최대 참여 인원수<br>
		<span id="people">${vo.people}</span>
	</div>
	<div>

	</div>
		<div>
			<a href="./fundingJoinWrite?num=${vo.num}" class="btn btn-primary">Participation</a>
			<a href="./fundingUpdate?num=${vo.num }" class="btn btn-success">Update</a>
			<a href="./fundingDelete?num=${vo.num }" class="btn btn-danger">Delete</a>
			<a href="./fundingList" class="btn btn-primary">List</a>
		</div>
	</div>
<script type="text/javascript">
	var goal = ${vo.goal};
	var price = ${vo.price};	  
	goal = goal.toLocaleString();
	price = price.toLocaleString();
	document.getElementById('price').innerHTML = price;
	document.getElementById('goal').innerHTML = goal;

	var startTime = '${vo.startTime}';
	var endTime = '${vo.endTime}';

	var start = startTime.substring(0, 16);
	var end = endTime.substring(0, 16);

	document.getElementById('startTime').innerHTML = start;
	document.getElementById('endTime').innerHTML = end;
	
</script>
</body>
</html>