<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/planner.css">
</head>
<body>
<c:import url="../template/nav.jsp"/>
	<div class="container">
		<h1>notice list</h1>
		<div class="section">

			<table class="table ">
				<tr>
					<th>num</th>
					<th>title</th>
					<th>writer</th>
					<th>date</th>
					<th>hit</th>
				</tr>
				<c:forEach items="${noticeVOs}" var="list">
					<tr>
						<td>${list.num }</td>
						<td><a href="./noticeSelect?num=${list.num}">${list.title }</a></td>
						<td>${list.id }</td>
						<td>${list.regDate }</td>
						<td>${list.hit }</td>
					</tr>
				</c:forEach>

			</table>

		</div>
		<input type="button" class="button2" value="write" id="write">
		<ul class="pager">
			<li><a href="#">Back</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">Next</a></li>
		</ul>
	</div>
<script type="text/javascript">
$('#write').click(function(){
	location.href="./noticeWrite";
})
</script>
</body>
</html>