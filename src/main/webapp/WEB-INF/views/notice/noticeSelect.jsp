<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h6>NOTICE</h6>
		<div class="section">
			<article>
			<div class="board_select_row">
				<h1 class="board_select_title">${noticeVO.title }</h1>
			</div>
			<div class="board_select_row">
				<div class="board_select_col board_select_column">num</div>
				<div class="board_select_col board_select_column">id</div>
				<div class="board_select_col board_select_column">regDate</div>
				<div class="board_select_col board_select_column">hit</div>
			</div>
			<div class="board_select_row board_select_border_bottom">
				<div class="board_select_col">${noticeVO.num}</div>
				<div class="board_select_col">${noticeVO.id}</div>
				<div class="board_select_col">${noticeVO.regDate}</div>
				<div class="board_select_col">${noticeVO.hit}</div>
			</div>
			<div class="board_select_row">
				<div class=" board_select_contents">
					${noticeVO.contents}
				</div>
			</div>
			</article>
			<div class="board_select_row"><br>
				<input type="button" class="button2" value="update" id="update">
				<input type="button" class="button" value="delete" id="delete">
			</div>
			
			
		</div>
	</div>
<script type="text/javascript">
	$('#delete').click(function(){
		location.href="noticeDelete?num=${noticeVO.num}";
	});
	$('#update').click(function(){
		location.href="noticeUpdate?num=${noticeVO.num}";
	});
</script>
</body>
</html>