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
		<h6>NOTICE</h6>
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
					<td class="board_title" style="padding-left: 13px;">${noticeVO.title }</td>
					<td>${noticeVO.id }</td>
					<td>${noticeVO.regDate}</td>
					<td>${noticeVO.hit}</td>
				</tr>
				</table>
			</div>
			<div class="board_select_row">
				<div class="board_select_contents">
					${noticeVO.contents}
				</div>
				<c:if test="${!empty noticeVO.noticeFilesVOs}">
					<div class="boardSelectFiles">
						<ul class="boardSelectFiles_ul">
							<li class="boardSelectFiles_li boardSelectFiles_title">첨부파일</li>
						<c:forEach items="${noticeVO.noticeFilesVOs}" var="files">
							<li class="boardSelectFiles_li paddingLeft20px"><span class="x"><b>x</b> <a href="#" class="fileLink">${files.oname}</a><b class="fileNum" hidden="hidden">${files.fnum}</b></span></li>
						</c:forEach>
						</ul>
							 <br>
					</div>
				</c:if>
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
	


// $.ajax({
//  	type: "GET",
//  	url:"./addSC",
//  	data:{
//  			title:response.title,
//  			firstimage: response.firstimage
//  	},
//  	success : function(result)
//  	{
//  	  		alert(response.title);    
//  	},
//  	error: function(result) {
		
// 	},
// 	complete : function() {
// 	  		location.href="../";
// 	}	
//  });  
</script>
</body>
</html>