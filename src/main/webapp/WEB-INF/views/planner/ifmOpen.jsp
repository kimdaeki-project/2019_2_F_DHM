<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifmOpen</title>
<link rel="stylesheet"  href="../css/schedule.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<c:import url="../template/boot.jsp"/>
</head>
<body>
	<p class="sch-ifm-p">음식점 목록</p>
	<div class="swiper-container">
		<ul class="swiper-wrapper nolist">
			
				<li class="swiper-slide ll" >
					<c:forEach items="${food }" var="fo">
						<div class="card"> 
							<div>${fo.title }</div>
							<div></div><img alt="여행사진" src="${fo.firstimage }" width="100px" height="100px"><br>
								 ${fo.addr1 } <br>
						</div>
					</c:forEach>
				</li>
			
		</ul>	
	</div>
	
	<br>
	<p class="sch-ifm-p">관광지 목록</p>
	<div class="swiper-container">
		<div class="swiper-wrapper nolist">
			<c:forEach items="${tour}" var="tu">
				<div class="swiper-slide ll" >
					<div> ${tu.title } <br>
						 ${tu.addr1 } <br>
						<img alt="여행사진" src="${tu.firstimage }" width="100px" height="100px">
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
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
<script type="text/javascript">

/* 	var swiper = new Swiper('.swiper-container', {
	    slidesPerView: 7,
	    spaceBetween: 5,
	    freeMode: true,
	    pagination: {
	      el: '.swiper-pagination',
	      clickable: true,
	    },
	  }); */

</script>
</body>
</html>