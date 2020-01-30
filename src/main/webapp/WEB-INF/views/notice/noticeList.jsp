<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3 style="text-align: center;">Notice list</h3>
		<div class="section">

			<!-- 			<table class="table "> -->
			<!-- 				<tr> -->
			<!-- 					<th>num</th> -->
			<!-- 					<th>title</th> -->
			<!-- 					<th>writer</th> -->
			<!-- 					<th>date</th> -->
			<!-- 					<th>hit</th> -->
			<!-- 				</tr> -->
			<%-- 				<c:forEach items="${noticeVOs}" var="list"> --%>
			<!-- 					<tr> -->
			<%-- 						<td>${list.num }</td> --%>
			<%-- 						<td><a href="./noticeSelect?num=${list.num}">${list.title }</a></td> --%>
			<%-- 						<td>${list.id }</td> --%>
			<%-- 						<td>${list.regDate }</td> --%>
			<%-- 						<td>${list.hit }</td> --%>
			<!-- 					</tr> -->
			<%-- 				</c:forEach> --%>
			<!-- 			</table> -->
			
			
			<table class="board_table">
				<tr>
					<th class="board_no_th">NO3</th>
					<th class="board_title_th">TITLE</th>
					<th class="board_writer_th">WRITER</th>
					<th class="board_date_th">DATE</th>
					<th class="board_hit_th">HIT</th>
				</tr>
				<c:forEach items="${noticePage.content}" var="list">
				<tr>
					<td>${list.num }</td>
					<td class="board_title">
						<a href="./noticeSelect?num=${list.num}">${list.title }</a>
					</td>
					<td>${list.id }</td>
					<td>${list.regDate }</td>
					<td>${list.hit }</td>
				</tr>
				 </c:forEach>
			</table>

		</div>
		<div class="board_list_btn">
			<input type="button" class="button" value="글쓰기" id="write">
		</div>

		<ul class="pager">
			<c:forEach begin="1" end="${noticePage.totalPages }" var="i">
<%-- 				<li><a href="?page=${postPage.number-1}">Back</a></li> --%>
					<li><a href="noticeList?page=${i-1}">${i}</a></li>
<%-- 				<c:if test="${noticePage.totalPages eq i }"><li><a href="?page=${i+1}">Next</a></li></c:if>		 --%>
			</c:forEach>
		</ul>
		
	</div>
	
<script type="text/javascript">
$('#write').click(function(){
	location.href="./noticeWrite";
});



</script>
</body>
</html>