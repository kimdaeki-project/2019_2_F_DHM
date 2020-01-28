<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifmOpen</title>
</head>
<body>
<c:forEach items="${list }" var="i">
	<p>${i.title }</p>
	<p>${i.addr1 }</p>
	<p>
		<img alt="여행사진" src="${i.firstimage }">
	</p>
</c:forEach>
</body>
</html>