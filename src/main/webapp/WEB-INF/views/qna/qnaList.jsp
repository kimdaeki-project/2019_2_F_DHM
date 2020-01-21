<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
</head>
<body>
<c:import url="../template/nav.jsp"/>
	<div class="container">
		<h1>qna list</h1>
		<div class="section">
			<table class="board_table">
				<tr>
					<th class="board_no_th">NO3</th>
					<th class="board_title_th">TITLE</th>
					<th class="board_writer_th">WRITER</th>
					<th class="board_date_th">DATE</th>
					<th class="board_hit_th">HIT</th>
				</tr>
				<c:forEach items="${qnaList}" var="list">
				<tr>
					<td>${list.num }</td>
					<td class="board_title">
						<a href="./noticeSelect?num=${list.num}">${list.title }</a>
					</td>
					<td>${list.writer }</td>
					<td>${list.regDate }</td>
					<td>${list.hit }</td>
				</tr>
				 </c:forEach>
			</table>
		</div>
	</div>
</body>
</html>