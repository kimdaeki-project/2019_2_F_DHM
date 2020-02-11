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
			
			<th>참여 아이디</th>
			<th colspan="6">가격</th>
			<th>참여 인원</th>
			<th>예약 취소</th>
		</tr>
	
	<c:forEach items="${vo.fundingJoinVOs}" var="list">
	<input type="hidden" value="${list.price}" name="price" id="price">
	<input type="hidden" value="${list.participationPeople}" name="participationPeople" id="participationPeople">
			<tr>
			<%-- <td>${param.fNum}</td>  --%>
				<td>${list.participationId}</td>
				<td colspan="6"><span id="price">${list.price}</span>원</td>
				<td>${list.participationPeople}</td>
				<td><a class="btn btn-danger" href="./fundingJoinDelete?num=${list.num}">취소</a></td>
			</tr>
			</c:forEach>
	</table>
</div>
<!-- <script type="text/javascript">
	var a = ${vo.price};
	var b = ${vo.participationPeople};
	var c = a * b;
	document.getElementById('total').value = c;
</script> -->
</body>
</html>