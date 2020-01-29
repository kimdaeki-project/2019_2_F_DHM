<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifmOpen</title>
<link rel="stylesheet" type="text/css" href="../css/makePlanner.css">
</head>
<body>
<p class="sch-ifm-p">음식점 목록</p>
<c:forEach items="${food }" var="fo">
<ul class="sch-ifm-ul" class="sch-ifm-ul">
	<li> ${fo.title } <br>
		 ${fo.addr1 } <br>
		<img alt="여행사진" src="${fo.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
<br>
<p class="sch-ifm-p">관광지 목록</p>
<c:forEach items="${tour }" var="tu">
<ul class="sch-ifm-ul" >
	<li> ${tu.title } <br>
		 ${tu.addr1 } <br>
		<img alt="여행사진" src="${tu.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
<br>
<p class="sch-ifm-p">문화시설 목록</p>
<c:forEach items="${culture }" var="cu">
<ul class="sch-ifm-ul" >
	<li> ${cu.title } <br>
		 ${cu.addr1 } <br>
		<img alt="여행사진" src="${cu.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
<br>
<p class="sch-ifm-p">숙박시설 목록</p>
<c:forEach items="${hotel }" var="ho">
<ul class="sch-ifm-ul" >
	<li> ${ho.title } <br>
		 ${ho.addr1 } <br>
		<img alt="여행사진" src="${ho.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
<br>
<p class="sch-ifm-p">여행코스 목록</p>
<c:forEach items="${course }" var="co">
<ul class="sch-ifm-ul">
	<li> ${co.title } <br>
		 ${co.addr1 } <br>
		<img alt="여행사진" src="${co.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
<br>
<p class="sch-ifm-p">쇼핑 목록</p>
<c:forEach items="${shopping }" var="sh">
<ul class="sch-ifm-ul">
	<li> ${sh.title } <br>
		 ${sh.addr1 } <br>
		<img alt="여행사진" src="${sh.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
<br>
<p class="sch-ifm-p">행사 목록</p>
<c:forEach items="${festival }" var="fe">
<ul class="sch-ifm-ul">
	<li> ${fe.title } <br>
		 ${fe.addr1 } <br>
		<img alt="여행사진" src="${fe.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
<br>
<p class="sch-ifm-p">레포츠 목록</p>
<c:forEach items="${report }" var="re">
<ul class="sch-ifm-ul">
	<li> ${re.title } <br>
		 ${re.addr1 } <br>
		<img alt="여행사진" src="${re.firstimage }" width="100px" height="100px">
	</li>
</ul>
</c:forEach>
</body>
</html>