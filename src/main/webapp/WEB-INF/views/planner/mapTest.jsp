<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/makePlanner.css" rel="stylesheet">
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91fb61305af50f444a07659b68d73d1f"></script>
<c:import url="../template/boot.jsp"/>
<body>
 <div class="map" id="map" style="width: 1920px; height: 960px;">
</div>
<div style="display: none;">
	<c:forEach items="${pp }" var="p">
		<p class="pp-index">${p }</p>
	
	</c:forEach>
</div>
<script src="../js/cityList.js"></script>
<script src="../js/kakaoMap.js"></script>
</body>
</html>