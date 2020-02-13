<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<nav>

	<div class="nav-contain">
	<button class="m-title">dhm planner</button>
		<div class="nav-logoWrapper"><img alt="logo" src="${pageContext.request.contextPath}/imgs/logos/KakaoTalk_20200213_113935862.png" class="nav-logoWrapper-img" ></div>
		<div class="nav-menuWrapper">
			<div class="nav-menu-ul">
				<a class="nav-li nav-li-login" draggable="false"  href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
				<a class="nav-li"  href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>
				<div class="nav-service-div">서비스 
					<a class="nav-service-div-a"  href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
					<a class="nav-service-div-a" href="${pageContext.request.contextPath}/qna/qnaList">qna</a>
					<a class="nav-service-div-a" href="${pageContext.request.contextPath}/gnb/serviceCenter">faq</a>
				</div>
				<a class="nav-li" href="${pageContext.request.contextPath}/funding/fundingList">펀딩</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/planner/myPlanner">나의 플래너</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/planner/makePlanner">플래너</a>
			</div>
		</div>
	</div>

</nav>

<script type="text/javascript">

$('#service').click(function(){
	$('.service_dropDown').toggleClass("displayBlock");
});
var localhost='${pageContext.request.contextPath}';
$('.nav-logoWrapper-img').click(function(){
	location.href=localhost+"/";
});

$(document).ready(function(){
	$('.nav-service-div-a').css("display", "none");
});



$('.nav-service-div').click(function(){
	$('.nav-service-div-a').toggle();
});

</script>