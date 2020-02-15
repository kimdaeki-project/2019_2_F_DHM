<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>카카오맵</title>
<style type="text/css">
	.roundNumber{
	width: 20px;
	height: 20px;
	border-radius: 10px;
	border: 2px solid white;
	background-color: red;
	color: white;
	line-height: 16px;
	text-align: center;
}
</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91fb61305af50f444a07659b68d73d1f"></script>
<c:import url="../template/boot.jsp"/>
<body>
	<c:if test="${lock lt 1 }">
		<i class="fa fa-lock" style="position: absolute; top: 5%; right: 7%; z-index: 999; color:gray;"></i>
	</c:if>
 <div class="map" id="map" style="width: 220px; height: 203px;">
</div>
<div style="display: none;">
	<c:forEach items="${pp }" var="p">
		<p class="pp-index" title="" id="">${p }</p>
	
	</c:forEach>
</div>
<script src="../js/cityList.js"></script>
<script src="../js/kakaoMap.js"></script>
<script type="text/javascript">
	map.setCenter(positions[${pp[pp.size()-1]}].latlng);
	map.setDraggable(false);
	map.setZoomable(false); 
</script>
</body>
</html>