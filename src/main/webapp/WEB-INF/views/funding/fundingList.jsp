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
	<div>
		<a href="./fundingWrite" class="btn btn-danger">Write</a>
	
	</div>

	<table class="table table-hover">
		<tr>
			<td>NUM</td>
			<td>NAME</td>
			<td>ID</td>
			<td>GOAL</td>
			<td>START TIME</td>
			<td>END TIME</td>
			<td>PEOPLE</td>
		</tr>
		
		<c:forEach items="${list.pageList.content}" var="vo" varStatus="i">
			<tr>
				<td>${vo.num}</td>
				<td><a href="./fundingSelect?num=${vo.num}">${vo.name}</a></td>
				<td>${vo.id}</td>
				<td>${vo.goal}</td>
				<td>${vo.startTime}</td>
				<td>${vo.endTime}</td>
				<td>${vo.people}</td>
			</tr>
		</c:forEach>
	
	</table>
	
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