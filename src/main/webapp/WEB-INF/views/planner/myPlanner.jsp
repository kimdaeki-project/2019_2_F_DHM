<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
<link rel="stylesheet"  href="../css/schedule.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div style="background-color: #f5f5f5;">
	<div class="header">
	</div>
	<div class="container container2">
		<div class="main-container">
			<div class="inner-wrap">
				<div class="container">
					<h2 class="mp-title">나의 국내여행</h2>
					<div class="p-wrapper">
						<div class="swiper-container">
							<ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
								<c:forEach items="${list}" var="vo" varStatus="i">
									<li class="swiper-slide mp-li" style="height: 250px; overflow: hidden; float: left;">
									<a href="../schedule/schedulePage?plNum=${vo.plNum}">
										<div class="mp-li-wrap">
											<div class="mp-card">
												<div class="mp-p">
													<img src="http://maps.googleapis.com/maps/api/staticmap?size=500x400&mobile=true&visible=39,17&path=color:0x|weight:1|48.861,2.342|46.686,7.856|47.046,8.308|47.369,8.538|50.088,14.424|48.209,16.373|45.434,12.339|43.769,11.257|41.895,12.482&&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight4%2Epng|48.861,2.342&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight2%2Epng|46.686,7.856&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight1%2Epng|47.046,8.308&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight0%2Epng|47.369,8.538&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight3%2Epng|50.088,14.424&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight2%2Epng|48.209,16.373&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight1%2Epng|45.434,12.339&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight2%2Epng|43.769,11.257&markers=scale:2|icon:http%3A%2F%2Fwww%2Estubbyplanner%2Ecom%2Fimg%5Fv13%2Fmarker%2Fmycity%5Fnight4%2Epng|41.895,12.482&key=AIzaSyAlG3b7IeRzDZW46KIpOFPtiIxXt9MU46I&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0xffffff%7Cvisibility:on&style=element:labels%7Cvisibility:simplified&style=element:labels.icon%7Cvisibility:off&style=element:labels.text%7Ccolor:0xcfcfcf%7Cvisibility:simplified&style=feature:administrative.country%7Celement:geometry.stroke%7Ccolor:0xd6d6d6%7Cvisibility:on%7Cweight:0.5&style=feature:poi%7Cvisibility:off&style=feature:water%7Celement:geometry%7Ccolor:0xd2f4f4%7Cvisibility:on&style=feature:water%7Celement:labels%7Cvisibility:off">
													<div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
												</div>
												<div class="mp-f">
													<div class="mp">${vo.title}</div>
													<div class="mp-f1"> ${days[i.index]} 일간</div>
													<div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
													<div class="mp-f3">${Dday[i.index]}</div>
												</div>
											</div>
										
										</div>
									</a>
									</li>
									</c:forEach>
									
							</ul>
						</div>
					
					</div>
				</div>
			</div>
		
		</div>
	</div>

</div>
<script type="text/javascript">
/* swiper */
	/* var swiper = new Swiper('.swiper-container', {
	   slidesPerView: 5,
	   spaceBetween: 0,
	   freeMode: true,
	   pagination: {
	     el: '.swiper-pagination',
	     clickable: true,
	   },
	 }); */

	var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 5,
	      spaceBetween: 0,
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	    });
</script>
</body>
</html>