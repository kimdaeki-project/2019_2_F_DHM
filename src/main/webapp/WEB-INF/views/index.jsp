<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="./member/membercss.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>index</h1>

	<ul class="nav navbar-nav">
		<li class="dropdown">member<span class="caret"></span>
			<ul class="dropdown-menu">
				<li><a href="${pageContext.request.contextPath}/member/memberJoin">member join</a></li>
				<li><a href="${pageContext.request.contextPath}/member/memberLogin">member Login</a></li>
				<li><a href="${pageContext.request.contextPath}/member/memberFacebookLogin">member FacebookJoin</a></li>
			</ul>
		</li>
	</ul>
	

</body>
</html>