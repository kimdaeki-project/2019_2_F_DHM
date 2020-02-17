<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 플래너</title>
<c:import url="../template/boot.jsp"/>
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<link rel="stylesheet"  href="../css/basic.css">
<link rel="stylesheet"  href="../css/schedule.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
</head>
<body>
<c:import url="../template/nav.jsp"/>
<c:choose>
<c:when test="${member ne null }">
<div style="background-color: #f5f5f5; min-height: 719px;">
	<div class="container">
		<div class="main-container row">
			<div class="inner-wrap">
				<div class="container" style=" margin-bottom: 50px;"">
				<c:choose>
					<c:when test="${list.size() eq 0 }">
						<a href="makePlanner">
							<img width="60%" height="100%" src="../imgs/no-planner.png" style="left: 22%; position: relative;">
						</a>
					</c:when>
					<c:otherwise>
					<h2 class="mp-title">나의 국내여행</h2>
					<div class="p-wrapper">
						<div class="">
							<ul class=" nolist" style=" clear: both;">
								<c:forEach items="${list}" var="vo" varStatus="i">
									<li class=" mp-li" style="height: 300px; overflow: hidden; float: left;">
									<a href="../schedule/schedulePage?plNum=${vo.plNum}">
										<div class="mp-li-wrap">
											<div class="mp-card">
												<div class="mp-p">
													<iframe src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
<%-- 													<img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
													<div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
												</div>
												<div class="mp-f">
													<div class="mp">${vo.title}</div>
													<div class="mp-f1"> ${days[i.index]} 일간</div>
													<div class="mp-f2">출발 : <fmt:formatDate value="${deDate[i.index]}" pattern="yy년MM월dd일"/></div>
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
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		
		</div>
	</div>

</div>
<c:import url="../template/footer.jsp"/>
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

</c:when>
	<c:otherwise>
		<script type="text/javascript">
			location.href ="../member/memberLogin?goBack=../planner/myPlanner";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>