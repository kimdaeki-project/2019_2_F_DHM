<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
	<div class="navRow">
			<div class="navTop">
				<div class="container">
					<div class="nav-logo">
						<div class="nav_logo">
							<a href="${pageContext.request.contextPath}/" class="nav_log_img"><img src="../imgs/logos/logo-green" class="nav_log_img"></a>
						</div>
						<div class="nav_gnb_menu">
							<ul class="gnb_ul">
								<c:if test= "${ empty member}"> 
								<li class="gnb_li gnb_login"><a href="${pageContext.request.contextPath}/member/memberLogin" style="color: #68a26c; font-weight: bold;">로그인</a></li>
								<li class="gnb_li"><a href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a></li>
								</c:if>
								<c:if test= "${not empty member}"> 
								<li class="gnb_li"><a href="${pageContext.request.contextPath}/member/memberLogout" style="cursor: pointer;" id="service">로그아웃</a></li>
								<li class="gnb_li"><a href="${pageContext.request.contextPath}/member/memberMypage" style="cursor: pointer;" id="service">마이페이지</a></li>
								</c:if>
							<li class="gnb_li">
																	<a style="cursor: pointer;" id="service"  >고객센터</a>
								<ul class="service_ul">
									<li class="service_li" id="nav_notice"><a href="${pageContext.request.contextPath }/notice/noticeList">notice</a></li>
									<li class="service_li" id="nav_qna" ><a href="${pageContext.request.contextPath}/qna/qnaList">qna</a></li>
									<li class="service_li" id="nav_fnq"><a href="${pageContext.request.contextPath }/gnb/serviceCenter">faq</a></li>
								</ul>
							</li>
							<li class="gnb_li"><a href="">예약내역</a></li>
							</ul>
<!-- 						<div class="service_dropDown"> -->
<!-- 							<ul class="service_dropDown_ul"> -->
<%-- 								<li class="service_dropDown_li"><a href="${pageContext.request.contextPath}/gnb/serviceCenter">FAQ</a></li> --%>
<%-- 								<li class="service_dropDown_li"><a href="${pageContext.request.contextPath}/notice/noticeList">NOTICE</a></li> --%>
<%-- 								<li class="service_dropDown_li"><a href="${pageContext.request.contextPath}/qna/qnaList">QNA</a></li> --%>
<!-- 							</ul> -->
<!-- 						</div> -->
					</div>
					</div>
				</div>
			</div>
			<div class="navBottom">
				<div class="container">
					<div class="nav_menu">
						<ul class="nav_menu_ul">
						
							<c:choose>
								<c:when test="${member ne null }">
									<li class="nav_menu_li"><a href="${pageContext.request.contextPath}/planner/myPlanner">나의 플래너</a></li>								
								</c:when>
								<c:otherwise>
									<li class="nav_menu_li"><a href="${pageContext.request.contextPath}/member/memberLogin">나의 플래너</a></li>
								</c:otherwise>
							</c:choose>
							<li class="nav_menu_li"><a href="${pageContext.request.contextPath}/planner/makePlanner">플래너만들기</a></li>
							<li class="nav_menu_li nav_menu_li_active"><a href="">템플릿</a></li>


						</ul>
					</div>
				</div>
			</div>
	</div>
</nav>

<script type="text/javascript">



function serviceChoose(){
//	alert('ll');
	$('.service_ul').toggleClass("displayBlock");
}


</script>