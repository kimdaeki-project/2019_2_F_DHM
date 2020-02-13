<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<article>

			<form:form action="qnaUpdate" modelAttribute="qnaVO" method="post">
			
			
			
				<div class="form-group">
				<label for="usr">title:</label> 
				<form:input	class="form-control" path="title"/>
			</div>
			<div class="form-group">
				<label for="usr">contents:</label>
				 <form:textarea path="contents" class="contents"/>
<%-- 				 <form:errors path="contents" /> --%>
			</div>
			
			<div class="float_right"><button class="button2">submit</button></div>
			<form:input path="num" class="displayNone"/>
			<form:input path="writer" class="displayNone"/>
			<form:input path="depth" class="displayNone"/>
			<form:input path="hit" class="displayNone"/>
			<form:input path="ref" class="displayNone"/>
			<form:input path="step" class="displayNone"/>
			
			
			</form:form>
		</article>
	</div>

<script type="text/javascript">
$('.contents').summernote({
    placeholder: 'write contents!',
    tabsize: 2,
    height: 500
  });
</script>
</body>
</html>