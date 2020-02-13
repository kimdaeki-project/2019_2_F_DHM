<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
<link rel="icon" href="../imgs/logos/logo-fav.ico">
</head>
<body>
<c:import url="../template/nav.jsp"/>
	<div class="container">
		<h1>${qnaVO.title }</h1>
		<div class="section">
			<article>
			<div class="board_select_row">
				<table class="board_table">
				<tr class="board_select_tr">
					<th class="board_title_th">TITLE</th>
					<th class="board_writer_th">WRITER</th>
					<th class="board_date_th">DATE</th>
					<th class="board_hit_th">HIT</th>
				</tr>
				<tr class="board_select_tr">
					<td class="board_title" style="padding-left: 13px;">${qnaVO.title }</td>
					<td>${qnaVO.writer}</td>
					<td>${qnaVO.regDate}</td>
					<td>${qnaVO.hit}</td>
				</tr>
				</table>
			</div>
			<div class="board_select_row">
				<div class="board_select_contents">
					${qnaVO.contents}
				</div>
			</div>
			</article>
			<div class="board_select_row"><br>
				<input type="button" class="button2" value="댓글쓰기" id="comment">
				<input type="button" class="button" value="update" id="update">
				<input type="button" class="button" value="delete" id="delete">
			</div>	
		</div>
	</div>
	
		
	
	<script type="text/javascript">
	$('#comment').click(function(){
		location.href="qnaComment?num=${qnaVO.num}";
		});

	$('#delete').click(function(){
		location.href="qnaDelete?num=${qnaVO.num}";
		});

	$('#update').click(function(){
		location.href="qnaUpdate?num=${qnaVO.num}";
		});
	</script>
</body>
</html>