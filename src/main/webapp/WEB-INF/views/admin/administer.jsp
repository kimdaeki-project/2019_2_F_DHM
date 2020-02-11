<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMINISTER</title>
<link rel="stylesheet" href="../css/admin.css">
</head>
<body>
<c:import url="../template/boot.jsp"/>
<c:choose>
<%-- 	<c:when test="${member.grade eq 9 }"> --%>
	<c:when test="${member eq null }">
	<div class="adm-body">
		<div class="adm-left">
			<a href="/"> <img alt="홈" src="../imgs/logos/logo-white.png" width="100%" height="80px"> </a>
			<p class="adm-left-p"><a class="adm-left-menu" id="" style="font-size: 30px;">관리 페이지 홈</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="City">도시 정보</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="Member" >멤버 관리</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="Funding" >펀딩 정보</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="Planner" >플래너 관리</a></p>
			</div>
		<div class="adm-right">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ인기도시 -->
			<div class="popular-city">
				<h1>BEST CITY</h1>
						<input type="hidden" value="4" id="rlfdl">
				<ul>
					<c:forEach items="${Lolist }" var="lo" varStatus="l" begin="0" end="3">
						<li>
							<div class="li-city">
								<div class="li-city-A" >
									<h3 style="text-align: center; font-weight: bold;">${lo.arName }</h3>
									<img alt="${lo.arName }" src="../city/${lo.arImg }" width="100%" height="150px" style="border-radius: 10%;">
									<p style="text-align: center;"><b style="font-size: 20px;">${lo.added }</b>명이 추가한 도시</p>
								</div>
								<div class="li-city-B"  >
									<div class="pie-chart-bak" id="A${l.index }"></div>
									<div style="display: none">
										<input id="arName${l.index }" value="${lo.arName }">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak0 }" id="무박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak1 }" id="1박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak2 }" id="2박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak3 }" id="3박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak4 }" id="4박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak5 }" id="5박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak6 }" id="6박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak7 }" id="7박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak8 }" id="8박">
										<input class="pie-bak${l.index }" type="hidden" value="${lo.bak9 }" id="9박">
									</div>
									<div class="pie-chart-transfer" id="B${l.index }"></div>
									<div style="display: none">
										<input class="pie-transfer${l.index }" type="hidden" value="${lo.subway }" id="기차">
										<input class="pie-transfer${l.index }" type="hidden" value="${lo.taxi }" id="택시">
										<input class="pie-transfer${l.index }" type="hidden" value="${lo.bus }" id="버스">
										<input class="pie-transfer${l.index }" type="hidden" value="${lo.mycar }" id="자차">
										<input class="pie-transfer${l.index }" type="hidden" value="${lo.airplane }" id="항공">
									</div>
								</div>
							</div>
						</li>					
					</c:forEach>
				</ul>
			</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ인기도시 -->
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ멤버 -->
<div style="clear: both; width: 97%;">
	<h1>MEMBERS</h1>
	<table class="member-table">
		<thead class="member-table-head">
			<tr>
				<th class="member-th member-id">아이디</th>
				<th class="member-th member-name">성함</th>
				<th class="member-th member-email">Email</th>
				<th class="member-th member-birth">생일</th>
				<th class="member-th member-gender">성별</th>
				<th class="member-th member-grade">분류</th>
				<th class="member-th member-sns">페북연동</th>
				<th class="member-th member-city">대표도시</th>
				<th class="member-th member-btn">수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memList }" var="mem" varStatus="m">
				<tr>
					<td class="member-th member-id">${mem.id }</td>
					<td class="member-th member-name">${mem.name }</td>
					<td class="member-th member-email">${mem.email }</td>
					<td class="member-th member-birtd">${mem.birth }</td>
					<c:choose>
						<c:when test="${mem.gender eq 1 }">
							<td class="member-th member-gender">MAN</td>
						</c:when>
						<c:otherwise>
							<td class="member-th member-gender">WOMAN</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${mem.grade eq 9 }">
							<td class="member-th member-grade">관리자</td>
						</c:when>
						<c:when test="${mem.grade eq 4 }">
							<td class="member-th member-grade">블랙리스트</td>
						</c:when>
						<c:when test="${mem.grade eq 1 }">
							<td class="member-th member-grade">플래너</td>
						</c:when>
						<c:otherwise>
							<td class="member-th member-grade">일반 고객</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${mem.social gt 0 }">
							<td class="member-th member-sns">O</td>
						</c:when>
						<c:otherwise>
							<td class="member-th member-sns">X</td>
						</c:otherwise>
					</c:choose>
					
					<td class="member-th member-city">${mem.helpcity }</td>
					<td class="member-th member-btn">
						<button class="member-update">수정</button>
						<button class="member-exclude">추방</button>
					</td>
				</tr>
			</c:forEach>
		
		</tbody>
	
	
	</table>

</div>
		</div>
		
	</div>
	
	
	
	
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("권한이 없는 접근입니다!");
			location.href="/";
		</script>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="../js/admin.js"></script>
</body>
</html>