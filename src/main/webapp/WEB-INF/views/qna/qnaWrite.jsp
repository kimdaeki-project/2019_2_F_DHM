<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		<article>
	<h1>${kind }</h1>
		<c:if test="${comment ne null}">
<%-- 			 --%>
			<div class="form-group">${qnaVO.contents}</div>
		</c:if>
			<form:form action="${kind }" modelAttribute="qnaVO" method="post">
			<div class="form-group">
				<label for="usr">title:</label> 
				<form:input	class="form-control" path="title" />
			</div>
			<div class="form-group">
				<label for="usr">writer:</label> 
				<form:input	class="form-control" path="writer"  />
			</div>
			<div class="form-group">
				<label for="usr">contents:</label>
				 <form:textarea path="contents" class="contents" id="content"/>
					
			</div>
			<form:input path="num" class="displayNone"/>
			<div class="float_right"><button class="button2">submit</button></div>
			</form:form>
			
		</article>
</div>
	<div style="height: 200px; background: gold; margin-top: 100px;">footer</div>
<script>
var contentsPlaceholder="write contents!";

if('${kind}'=='qnaComment'){
	contentsPlaceholder=" ";
	$('#content').html(contentsPlaceholder);
	$('#title').text(contentsPlaceholder);
	$('#writer').text(contentsPlaceholder);
}

$('.contents').summernote({
    placeholder: contentsPlaceholder,
    tabsize: 2,
    height: 500
  });


  </script>
</body>
</html>