<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="../css/funding.css">
<link rel="stylesheet"  href="../css/basic.css">
<title>DHM Planner</title>
<c:import url="./template/fundingBoot.jsp"></c:import>

</head>
<body>
<c:import url="../template/nav.jsp"/>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<div class="container">
	<div class="form-group">
		
		
		<h3 id="name" style="text-align: center;">${vo.name}</h3>
		
		<p class="excert">${ vo.contents }</p>
		<div style="margin: 0 0 15px 30px;">
		<p style="text-align: right;">
		<span style="font-size: 20px;">금액</span>
		<span id="price" style="font-size: 20px; font-weight: bold;"></span>원
		</p>
		<p style="text-align: right;">
		<span style="font-size: 20px;">모인 금액</span>
		<span id="save_price" style="font-size: 20px; font-weight: bold;"></span>원
		</p>
		<p style="text-align: right;">
		<span style="font-size: 20px;">펀딩 목표</span>
		<span id="goal" style="font-size: 20px; font-weight: bold;"></span>원
		</p>
		</div>
		<div style="text-align: right;">
		<h3>여행 시작 시간</h3>
		<span id="startTime" style="font-size: 20px; font-weight: bold;"></span>
		<h3>여행 마침 시간</h3>
		<span id="endTime" style="font-size: 20px; font-weight: bold;"></span>
		<h3>현재 참여 인원수</h3>
		<span id="people" style="font-size: 20px; font-weight: bold;">${vo.participationPeople}</span>
		</div>
	</div>
	<div style="text-align: center; margin-bottom: 50px;">
			<button id="btn" class="btn btn-primary" style="font-size: 30px; padding-left: 15px; padding-right: 15px; margin: 10px">참여하기</button>
	</div>
		<div style="text-align: center; margin-bottom: 50px;">
		<%-- <c:if test="${member.id eq vo.id }"> --%>
			<a href="./fundingUpdate?num=${vo.num }" class="btn btn-success" style="font-size: 30px; padding-left: 15px; padding-right: 15px; margin: 10px">수정</a>
			<button class="btn btn-danger" id="del" style="font-size: 30px; padding-left: 15px; padding-right: 15px; margin: 10px">삭제</button>
		<%-- </c:if> --%>
		<a href="./fundingJoinList?fNum=${vo.num}" class="btn btn-info" style="font-size: 30px; padding-left: 15px; padding-right: 15px; margin: 10px">참여자 확인</a>
			<a href="./fundingList" class="btn btn-info" style="font-size: 30px; padding-left: 15px; padding-right: 15px; margin: 10px">목록</a>
		</div>
	</div>
	${vo.plNum}
	<c:import url="../schedule/schedulePage?plNum=${vo.plNum}" />
<script type="text/javascript">
	var goal = ${vo.goal};
	var status = ${vo.status};
	var price = ${vo.price};
	/* 펀딩 성공시 펀딩 버튼 막기 */
	var dif = goal - status;

	
	
	goal = goal.toLocaleString();
	price = price.toLocaleString();
	save_price = save_price.toLocaleString();
	
	document.getElementById('price').innerHTML = price;
	document.getElementById('goal').innerHTML = goal;
	document.getElementById('save_price').innerHTML = status;
	
	var startTime = '${vo.startTime}';
	var endTime = '${vo.endTime}';

	var start = startTime.substring(0, 16);
	var end = endTime.substring(0, 16);

	document.getElementById('startTime').innerHTML = start;
	document.getElementById('endTime').innerHTML = end;


	/* 현재 날짜와 여행 시작 날짜를 비교하여 날짜가 지나면 펀딩 막기 */
	var today = new Date();
	today = today.toLocaleString();
	today = today.substring(0, 11);
	var today_ar = today.split(". ");
	console.log(today);
	console.log(today_ar);
	
	/* 여행 시작시간에서 년 월 일만 추출 */
	var start2 = startTime.substring(0, 10);
	var start_ar = start2.split("-");
	console.log(start2);
	console.log(start_ar);

	var to = new Date(today_ar[0], today_ar[1], today_ar[2]);
    var st = new Date(start_ar[0], start_ar[1], start_ar[2]);
	
    var dif2 = st - to;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

	var dif3 = dif2/cDay;

	console.log(to);
	console.log(st);
	console.log(dif3);
	
	if(dif <= 0){
		document.getElementById('btn').innerHTML = "펀딩 성공";
		$("#btn").attr('disabled', true);
		} else {
			if(dif3 <= 0){
				document.getElementById('btn').innerHTML = "펀딩 마감";
				$("#btn").attr('disabled', true);
			}
		}
	
	$("#btn").click(function(){
		location.href = "./fundingJoinWrite?num=${vo.num }";
		});

	$("#del").click(function() {
		if (confirm("삭제하시겠습니까?") == true){    //확인

		     location.href="./fundingDelete?num=${vo.num}";

		 }else{   //취소
		     return false;
		 }
		});
	
</script>
</body>
</html>