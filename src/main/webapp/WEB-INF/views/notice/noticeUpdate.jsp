<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Write</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div class="container">
	<article>
	<h1>Notice Update</h1>
			<form:form action="noticeWrite" modelAttribute="noticeVO" method="post">
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
			
			<div class="float_right"><button class="button2">submit</button></div>
			</form:form>
			
		</article>
</div>
	<div style="height: 200px; background: gold; margin-top: 100px;">footer</div>


<script>
$('.contents').summernote({
    placeholder: 'write contents!',
    tabsize: 2,
    height: 500
  });
  </script>
</body>
</html>