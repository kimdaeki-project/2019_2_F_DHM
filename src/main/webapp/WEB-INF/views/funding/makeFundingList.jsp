<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<link rel="stylesheet"  href="../css/funding.css">
<c:import url="./template/fundingBoot.jsp" />
<meta charset="UTF-8">
<link rel="stylesheet"  href="../css/basic.css">
<title>DHM Planner</title>
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div class="container">
<c:choose>
<c:when test="${vo.size() eq 0 }">
						<a href="fundingPlanner">
							<img width="60%" height="100%" src="../imgs/no-funding.png" style="left: 22%; position: relative;">
						</a>
					</c:when>
<c:otherwise>
	
	<div class="funding_main">
		<div class="funding_inner_wrap">
		<div class="funding_titarea">
			<h3 class="funding_title">
				나의 펀딩 리스트
			</h3>
		</div>

	<div class="funding_area">
		<c:forEach items="${vo}" var="list" varStatus="i">
			<div class="funding_block">
				<div class="funding_block2">
					<div class="funding_block3">
					<div class="funding_inner_area">
					
				<a href="./fundingSelect?num=${list.num}">
				<img class="funding_img" src="../test_img/test${i.index}.jpg"></a>
						</div>
					</div>
					<div style="height: 50px; font-size: 15px; font-weight: bold; padding: 5px;">
						${list.name}
					</div>
					<div class="funding_inner_area2">
						<%-- <div class="funding_end" style="font-size: 1em;">
							펀딩 목표 금액 : <span id="comma${i.index}">${vo.goal}</span>원
						</div> --%>
						<div class="funding_start">
							<span class="glyphicon glyphicon-calendar"></span>
							${list.restTime} 일 남았어요!
						</div>
						<div class="funding_bar">
							<div class="funding_bar2" style="width: ${list.gage}%;min-width: 0%;background: rgb(250, 100, 98);transition-duration: 200ms;height: 2px;"></div>
						</div>
						<div class="funding_start" style="float: right; padding-right: 1em">
							${list.gage}%
						</div>
						<div  class="funding_start" style="float: left; padding-right: 1em">
							현재 모인 금액 : ${list.status}원
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	
			</div>
		</div>
	</div>
	</c:otherwise>
</c:choose>
</div>

</body>
</html>