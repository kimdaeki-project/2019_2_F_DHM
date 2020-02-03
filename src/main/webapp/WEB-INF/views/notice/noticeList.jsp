<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
</head>
<body>
<c:import url="../template/nav.jsp"/>
	<div class="container">
		<h3 class="page_title">Notice list</h3>
		<!-- search -->
		<form action="./noticeList" method="get" >
		<img alt="" src="../images/search_icon.png" style="width: 24px; height: 24px; display: inline; float: left; margin:0 5px 5px 5px;" id="icon">
		<div class="board-search-wrapper">
			<input type="text" class="board-search-inputText" id="searchingFor" name="searchingFor"><button class="board-search-btn">검색</button>
		</div>
		</form>
		<!-- search -->
		<div class="section">

			
			<c:set var="now" value="<%=new Date() %>"/>
			<fmt:formatDate value="${now}"  type="date" pattern="yyyy-MM-dd" />			
			<table class="board_table">
				<tr>
					<th class="board_no_th" >NO</th>
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
						<td>${list.regDate}</td>
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

$('.board-search-btn').click(function(){
	//ok;
	var searchingFor=$('#searchingFor').val();
	if(!searchingFor){
		alert('검색어를 입력해 주세요');
		}
});


</script>
</body>
</html>