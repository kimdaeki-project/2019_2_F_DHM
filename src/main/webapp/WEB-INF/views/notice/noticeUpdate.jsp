<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Write</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
<link rel="icon" href="../imgs/logos/logo-fav.ico">
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div class="container">
	<article>
	<h1>Notice Update</h1>
			<form:form action="noticeUpdate" modelAttribute="noticeVO" method="post"  enctype="multipart/form-data">
				<div class="form-group">
				<label for="usr">title:</label> 
				<form:input	class="form-control" path="title"/>
<%-- 				<form:errors path="title" /> --%>
			</div>
			<div class="form-group">
				<label for="usr">contents:</label>
				 <form:textarea path="contents" class="contents"/>
<%-- 				 <form:errors path="contents" /> --%>
			</div>
			
			<form:input path="num" class="displayNone"/>
			<form:input path="id" class="displayNone"/>

			<form:input path="hit" class="displayNone"/>
			
			<c:forEach items="${noticeVO.noticeFilesVOs }" var="noticeFiles">
				<p class="fileLink">${noticeFiles.oname }&nbsp;&nbsp;&nbsp; <span class="x" title="${noticeFiles.fnum }">x</span></p> <br>
			</c:forEach>
			
			<div class="fileDiv">
				<div>
						
				</div>
			</div>
			<input type="button" value="plus files" id="filePlus">
			<div class="float_right"><button class="button2">submit</button></div>
			
			</form:form>
		</article>
</div>
<input type="text" value="${fileSize}" id="fileSize" class="displayNone">


<script>
$('.contents').summernote({
    placeholder: 'write contents!',
    tabsize: 2,
    height: 500
  });

var count=$('#fileSize').val();

$('#filePlus').click(function(){
	if(count==5){
		alert('더이상 파일을 추가할 수 없습니다.')}
	else{
	count++;
	$('.fileDiv').append('<input type="file" class="inputFile" name="files"> ');
		}
});

$('.x').click(function(){
	var con=confirm("정말 삭제 하시겠습니까?");
	if(con==true){
		var fnum=$(this).prop('title');	
		$.ajax({
				type:"get",
				url: "notice_file_delete", 
				data:{
					fileNum:fnum
					},
				success: function(result){
				if(!result){
					alert('삭제되었습니다');
					$(this).parent().remove();
					location.reload();
					}else{
					alert('삭제 실패');
						}
			   
		  }});
		}
});
  </script>
</body>
</html>