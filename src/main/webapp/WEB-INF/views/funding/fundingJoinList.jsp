<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대동여행지도</title>
</head>
<body>
<div class="contents">
	<table class="table table-hover">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td colspan="6">가격</td>
			<td>참여 인원</td>
		</tr>
	
	<c:forEach items="${vo.fundingJoinVOs}" var="list">
			<tr>
				<td>${list.num}</td>
				<td>${list.id}</td>
				<td>${list.price}</td>
				<td>${list.participationPeople}</td>
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