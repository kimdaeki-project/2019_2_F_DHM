<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title >관리메뉴</title>
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<link rel="stylesheet" href="../css/admin.css">
</head>
<body>
<c:import url="../template/boot.jsp"/>
<c:choose>
	<c:when test="${member.grade eq 9 }">
	<div class="adm-body">
		<div class="adm-left">
			<a href="/"> <img alt="홈" src="../imgs/logos/logo-white.png" width="100%" height="80px"> </a>
			<p class="adm-left-p"><a class="adm-left-menu" id="City" href="#adm-city">도시 정보</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="Member" href="#adm-member">멤버 관리</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="Planner" href="#adm-planner">플래너 정보</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="Funding" href="#adm-funding">펀딩 정보</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="review" >리뷰 관리</a></p>
			<p class="adm-left-p"><a class="adm-left-menu" id="advertisement" href="#adm-advertisement">광고 문의</a></p>
			</div>
		<div class="adm-right">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ인기도시 -->
			<div class="today-info">
				<ul>
					<li>
						<p class="today-info-top">신규 회원가입</p>
						<p class="today-info-bot"><font style="font-size: 30px; ">${newM }</font> 명</p>
					</li>
					<li>
						<p class="today-info-top">오늘 생성된 플래너</p>
						<p class="today-info-bot"><font style="font-size: 30px; ">${newP }</font> 개</p>
					</li>
					<li>
						<p class="today-info-top">오늘 신청된 펀딩</p>
						<p class="today-info-bot"><font style="font-size: 30px; ">${newF }</font> 개</p>
					</li>
					<li>
						<p class="today-info-top">오늘 신청된 광고 문의</p>
						<p class="today-info-bot"><font style="font-size: 30px; ">${newA }</font> 개</p>
					</li>
				</ul>
			</div>
			<div class="popular-city" id="adm-city" >
				<h1 class="adm-info-h1">CITY INFO</h1>
						<input type="hidden" value="17" id="rlfdl">
				<ul>
					<c:forEach items="${Lolist }" var="lo" varStatus="l" begin="0" end="17">
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
			<div style="clear: both; width: 97%;" class="adm-member"  id="adm-member">
				<h1 class="adm-info-h1">MEMBERS - 새로 가입한 멤버 : ${newM } 명</h1>
				<table class="member-table">
					<thead class="member-table-head">
						<tr>
							<th class="member-th member-id">아이디</th>
							<th class="member-th member-name">성함</th>
							<th class="member-th member-email">Email</th>
							<th class="member-th member-birth">생일</th>
							<th class="member-th member-gender">성별</th>
							<th class="member-th member-grade">분류</th>
							<th class="member-th member-sns">광고수신동의</th>
							<th class="member-th member-city">대표도시</th>
							<th class="member-th member-how">생성플래너</th>
							<th class="member-th member-btn">추방</th>
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
									<c:when test="${mem.mailCheck gt 0 }">
										<td class="member-th member-sns">O</td>
									</c:when>
									<c:otherwise>
										<td class="member-th member-sns">X</td>
									</c:otherwise>
								</c:choose>
								
								<td class="member-th member-city">${mem.helpcity }</td>
								<td class="member-th member-how">${howMany[m.index] } 개</td>
								<td class="member-th member-btn">
									<button class="member-exclude" value="${mem.id }">추방</button>
								</td>
							</tr>
						</c:forEach>
					
					</tbody>
				
				
				</table>
			
			</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ멤버 -->
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ플래너-->
			<div class="adm-planner"  id="adm-planner">
				<h1 class="adm-info-h1">PLANNER - 새로 추가된 플래너 : ${newP } 개</h1>
				<ul>
					<c:forEach items="${plList }" var="pl" varStatus="p">
						<li>
							<div class="adm-planner-div">
								<p style="background-color: #18A8F1; color: white;">플래너 번호 : ${pl.plNum }</p>
								<p>플래너 제목 : ${pl.title }</p>
								<p>플래너 타입 : ${pl.type }</p>
								<p>플래너 ID : ${pl.id }</p>
							</div>	
						</li>
					</c:forEach>
				</ul>
			</div>		
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ플래너-->
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ펀딩-->
			<div class="adm-funding"  id="adm-funding">
				<h1 class="adm-info-h1">FUNDING - 새로 추가된 펀딩 : ${newF } 개</h1>
				<ul>
					<c:forEach items="${fuList }" var="fu" varStatus="f">
						<li>
							<div class="adm-funding-div">
								<p style="background-color: #18A8F1; color: white;">${fu.name }</p>
								<p>펀딩 목표 금액 : ${fu.goal }</p>
								<p>현재 펀딩 금액 : ${fu.price }</p>
								<p>펀딩 참여 인원 : ${fu.participationPeople }</p>
								<p>펀딩 모집자 : ${fu.id }</p>
								<p></p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ펀딩-->
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ광고문의-->
		<div class="adm-advertisement" id="adm-advertisement">
			<br>
			<h1 class="adm-info-h1"> ADVERTISEMENT - 새로 등록된 광고 문의 : ${newA } 개</h1>
			<ul>
					<c:forEach items="${adList }" var="adv">
						<li>
							<div class="adm-funding-div">
								<p style="background-color: #18A8F1; color: white;">광고 목적 회사 : ${adv.ccompon }</p>
								<p>문의자 메일 : ${adv.cemail }</p>
								<p>광고 목적 도시 : ${adv.ccity }</p>
								<p>광고 내용 : ${adv.ccintro }</p>
								<p>연락처 : ${adv.cphone }</p>
								<p>문의 요청 날짜 : ${adv.coMakeDay }</p>
								<p></p>
							</div>
						</li>
					</c:forEach>
				</ul>
		</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ광고문의-->	
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
