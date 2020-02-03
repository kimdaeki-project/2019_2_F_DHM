<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<nav>
	<div class="navRow">
			<div class="navTop">
				<div class="container">
					<div class="nav-logo">
						<div class="nav_logo">
							<a href="${pageContext.request.contextPath}/" class="nav_log_img"><img src="../images/logo.png" class="nav_log_img"></a>
						</div>
						<div class="nav_gnb_menu">
							<ul class="gnb_ul">
							<c:if test= "${empty member}">
								<li class="gnb_li gnb_login"><a href="${pageContext.request.contextPath}/member/memberLogin" 
								style="color: #68a26c; font-weight: bold;">로그인</a></li>
								<li class="gnb_li"><a href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a></li>
								<li class="gnb_li"><a style="cursor: pointer;" id="service">고객센터</a></li>
								<li class="gnb_li"><a href="">예약내역</a></li>
							</c:if>
							
							<c:if test= "${not empty member}">
								<li class="gnb_li"><a href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a></li>
								<li class="gnb_li"><a href="${pageContext.request.contextPath}/member/memberMypage">마이페이지</a></li>
							</c:if>
							</ul>
						<div class="service_dropDown">
							<ul class="service_dropDown_ul">
								<li class="service_dropDown_li"><a href="${pageContext.request.contextPath}/gnb/serviceCenter">FAQ</a></li>
								<li class="service_dropDown_li"><a href="${pageContext.request.contextPath}/notice/noticeList">NOTICE</a></li>
								<li class="service_dropDown_li"><a href="${pageContext.request.contextPath}/qna/qnaList">QNA</a></li>
							</ul>
						</div>
					</div>
					</div>
				</div>
			</div>
			<div class="navBottom">
				<div class="container">
					<div class="nav_menu">
						<ul class="nav_menu_ul">
							<li class="nav_menu_li"><a href="">홈</a></li>
							<li class="nav_menu_li"><a href="">플래너</a></li>
							<li class="nav_menu_li"><a href="">탐색</a></li>
							<li class="nav_menu_li nav_menu_li_active"><a href="">유럽투어</a></li>
							<li class="nav_menu_li"><a href="">숙소</a></li>
							<li class="nav_menu_li"><a href="">템플릿</a></li>
						</ul>
					</div>
				</div>
			</div>
	</div>
</nav>
<script type="text/javascript">
$('#service').click(function(){
	$('.service_dropDown').toggleClass("displayBlock");
})
</script>