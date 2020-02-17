<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<h1>Notice Write</h1>
			<form:form action="noticeWrite" modelAttribute="noticeVO" method="post" enctype="multipart/form-data">
				<div class="form-group">
				<label for="usr">title:</label> 
				<form:input	class="form-control" path="title" />
				<form:errors path="title" />
			</div>
			<div class="form-group">
				<label for="usr">contents:</label>
				 <form:textarea path="contents" class="contents"/>
<%-- 				 <form:errors path="contents" /> --%>
			</div>
			<div class="fileDiv">
				<div>
						
				</div>
			</div>
			<input type="button" value="plus files" id="filePlus">
			<div class="float_right"><button class="button2">submit</button></div>
			</form:form>
			
		</article>
</div>

<script>
$('.contents').summernote({
    placeholder: 'write contents!',
    tabsize: 2,
    height: 500
  });

var count=0;

$('#filePlus').click(function(){
	if(count==5){
		alert('더이상 파일을 추가할 수 없습니다.')}
	else{
	count++;
	$('.fileDiv').append('<input type="file" class="inputFile" name="files"> ');
		}
});
  </script>
</body>
</html>