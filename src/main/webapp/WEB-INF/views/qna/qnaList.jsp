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
		<h3 style="text-align: center;">Qna list</h3>
		<div class="section">
			<table class="board_table">
				<tr>
					<th class="board_no_th">NO</th>
					<th class="board_title_th">TITLE</th>
					<th class="board_writer_th">WRITER</th>
					<th class="board_date_th">DATE</th>
					<th class="board_hit_th">HIT</th>
				</tr>
				<c:forEach items="${qnaList.content}" var="list">
				<tr>
					<td>${list.num }</td>
					<td class="board_title">
						<a href="./qnaSelect?num=${list.num}">
							<c:if test="${list.depth gt 0 }"><c:forEach begin="0" end="${list.depth-1}">┗</c:forEach></c:if>
							${list.title }
						</a>
					</td>
					<td>${list.writer }</td>
					<td>${list.regDate }</td>
					<td>${list.hit }</td>
				</tr>
				 </c:forEach>
			</table>
		</div>
		<div class="board_list_btn">
			<input type="button" class="button" value="글쓰기" id="write">
			<input type="button" class="button" value="전체 지우기" id="deleteAll">
		</div>
		
		<ul class="pager">
			<c:forEach begin="1" end="${qnaList.totalPages }" var="i">
<%-- 				<li><a href="?page=${postPage.number-1}">Back</a></li> --%>
					<li><a href="qnaList?page=${i-1}">${i}</a></li>
<%-- 				<c:if test="${noticePage.totalPages eq i }"><li><a href="?page=${i+1}">Next</a></li></c:if>		 --%>
			</c:forEach>
		</ul>

	</div>
<script type="text/javascript">
//write one qna
$('#write').click(function(){
	location.href="qnaWrite";
});


//delete all
$('#deleteAll').click(function(){
	var conf=confirm('정말로 전체 글을 지우시겠습니까?');
	if(conf){
		var conf2=confirm('정말류?  ^^; ');
		if(conf2){
			location.href="qnaDeleteAll";
			}
	}
})
</script>
</body>
</html>