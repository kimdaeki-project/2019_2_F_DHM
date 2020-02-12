<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대동여행지도</title>
<link rel="stylesheet"  href="../css/funding.css">
<c:import url="./template/fundingBoot.jsp" />
<link rel="stylesheet"  href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div class="container">
	<table class="table ">
		<tr>
			
			<th colspan="6">펀딩 제목</th>
			<th>펀딩하는 아이디</th>
			<th>여행 시작 시간</th>
			<th>여행 마침 시간</th>
			<th>금액</th>
			<th>참여 인원</th>
			<th>총 금액</th>
			<th>예약 취소</th>
		</tr>
		<%-- <tr>
			<td colspan="6">${vo.name}</td>
			<td>${vo.id}</td>
			<td>${vo.startTime}</td>
			<td>${vo.endTime}</td>
			<td><span id="price">${vo.price}</span>원</td>
				<c:forEach items="${vo.fundingJoinVOs}" var="list">
					<td>${list.participationPeople}</td>
					<td><span id="total"></span>원</td>
					<td><a class="btn btn-danger" href="./fundingJoinDelete?num=${list.num}">취소</a></td>
				</c:forEach>
		</tr> --%>
		
		<tr>
		
			<td colspan="6"><a href="./fundingSelect?num=${vo.fundingVO.num}">${vo.fundingVO.name}</a></td>
			<td>${vo.fundingVO.id}</td>
			<td>${vo.fundingVO.startTime}</td>
			<td>${vo.fundingVO.endTime}</td>
			<td><span id="price">${vo.fundingVO.price}</span>원</td>
			<td>${vo.participationPeople}</td>
			<td><span id="total"></span>원</td>
			<td><a class="btn btn-danger" href="./fundingJoinDelete?num=${vo.num}">취소</a></td>
				
		</tr>
		
	</table>
</div>
<script type="text/javascript">
	var a = ${vo.fundingVO.price};
	var b = ${vo.participationPeople};
	var c = a * b;
	document.getElementById('total').innerHTML = c;
</script>
</body>
</html>