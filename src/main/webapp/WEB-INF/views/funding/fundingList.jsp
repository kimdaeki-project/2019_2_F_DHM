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
<style>
#map{
margion: 0 auto;
width: 100%;
}
</style>
<body>
<c:import url="../template/nav.jsp"/>
<div class="container">
		
	
	<div class="funding_main">
		<div class="funding_inner_wrap">
		<div class="funding_titarea">
			<h3 class="funding_title">
				펀딩 리스트
			</h3>
		</div>
	<div style="text-align: right; margin: 15px;">
		<a href="./fundingWrite" class="btn btn-danger">Write</a>
	</div>
	
	<div class="funding_area">
		<c:forEach items="${list.pageList.content}" var="vo" varStatus="i">
				<a href="./myFundingSelect?num=${vo.num}">
			<div class="funding_block">
				<div class="funding_block2">
					<div class="funding_block3">
					<div class="funding_inner_area">
					
				 <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum}" width="100%" height="100%" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
								<%-- <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div> --%>     
						</div>
					</div>
					<div style="height: 50px; font-size: 15px; font-weight: bold; padding: 5px;">
						${vo.name}
					</div>
					<div class="funding_inner_area2">
						<%-- <div class="funding_end" style="font-size: 1em;">
							펀딩 목표 금액 : <span id="comma${i.index}">${vo.goal}</span>원
						</div> --%>
						<div class="funding_start">
							<span class="glyphicon glyphicon-calendar"></span>
							${vo.restTime} 일 남았어요!
						</div>
						<div class="funding_bar">
							<div class="funding_bar2" style="width: ${vo.gage}%;min-width: 0%;background: rgb(250, 100, 98);transition-duration: 200ms;height: 2px;"></div>
						</div>
						<div class="funding_start" style="float: right; padding-right: 1em">
							${vo.gage}%
						</div>
						<div  class="funding_start" style="float: left; padding-right: 1em">
							현재 모인 금액 : ${vo.status}원
						</div>
					</div>
				</div>
			</div>
	</a>
		</c:forEach>
			</div>
		</div>
	</div>
	<div style="margin: 0 auto; text-align: center;">
	<ul class="pagination" style="margin:50px 0;">
		<c:if test="${pager.curBlock > 1}">
			<li><a href="./fundingList?curPage=${pager.startNum-1}">[이전]</a></li>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li><a href="./fundingList?curPage=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pager.curBlock < pager.totalBlock}">
			<li><a href="./fundingList?curPage=${pager.startNum-1}">[다음]</a></li>
		</c:if>
	</ul>
	</div>
</div>

</body>
</html>