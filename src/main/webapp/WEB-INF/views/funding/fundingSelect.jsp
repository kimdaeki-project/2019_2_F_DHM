<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대동여행지도</title>
<c:import url="../template/boot.jsp"></c:import>

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
		펀딩 금액<br><input type="text" id="price">원<br><br>
		펀딩 목표<br><input type="text" id="goal">원<br><br>
		펀딩 시작 시간<br>
		<span id="startTime">${vo.startTime}</span><br><br>
		펀딩 마감 시간<br>
		<span id="endTime">${vo.endTime}</span><br><br>
		펀딩 최대 참여 인원수<br>
		<span id="people">${vo.people}</span>
	</div>
	<div>

	</div>
		<div>
			<a href="./fundingParticipation?num=${vo.num}" class="btn btn-primary">Participation</a>
			<a href="./fundingUpdate?num=${vo.num }" class="btn btn-success">Update</a>
			<a href="./fundingDelete?num=${vo.num }" class="btn btn-danger">Delete</a>
			<a href="./fundingList" class="btn btn-primary">List</a>
		</div>
	</div>
<script type="text/javascript">
var goal = ${vo.goal};
var price = ${vo.price};	  
	   document.getElementById("goal").value = goal.toLocaleString();
	   document.getElementById("price").value = price.toLocaleString();
</script>
</body>
</html>