<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="../css/funding.css">
<c:import url="./template/fundingBoot.jsp" />
<meta charset="UTF-8">
<title>대동여행지도</title>
</head>
<body>
<div class="contents">
	
		<a href="./fundingWrite" class="btn btn-danger">Write</a>
	
	<div class="funding_main">
		<div class="funding_inner_wrap">
		<div class="funding_titarea">
			<h3 class="funding_title">
				모든 펀딩 리스트
			</h3>
		</div>
	<div class="funding_area">
	
		<c:forEach items="${list.pageList.content}" var="vo" varStatus="i">
			<div class="funding_block">
				<div class="funding_block2">
					<div class="funding_block3">
						<div class="funding_inner_area">
				<a href="./fundingSelect?num=${vo.num}">
				<img class="funding_img" src="../test_img/test${i.index}.jpg"></a>
						</div>
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
		</c:forEach>
	
	</div>
		</div>
	</div>
	<div>
		<c:if test="${pager.curBlock > 1}">
			<a href="./fundingList?curPage=${pager.startNum-1}">[이전]</a>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<a href="./fundingList?curPage=${i}">${i}</a>
		</c:forEach>
		<c:if test="${pager.curBlock < pager.totalBlock}">
			<a href="./fundingList?curPage=${pager.startNum-1}">[다음]</a>
		</c:if>
	
	</div>

</div>

</body>
</html>