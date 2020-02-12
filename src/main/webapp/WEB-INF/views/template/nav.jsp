<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<nav>
	<div class="nav-contain">
	<button class="m-title">dhm planner</button>
		<div class="nav-logoWrapper"><img alt="logo" src="${pageContext.request.contextPath}/imgs/logos/logo-white.png" class="nav-logoWrapper-img" ></div>
		<div class="nav-menuWrapper">
			<div class="nav-menu-ul">
				<a class="nav-li nav-li-login" draggable="false"  href="${pageContext.request.contextPath}/member/memberLogin">login</a>
				<a class="nav-li"  href="${pageContext.request.contextPath}/member/memberJoin">join</a>
				<a class="nav-li"  href="${pageContext.request.contextPath}/notice/noticeList">notice</a>
				<a class="nav-li"  href="${pageContext.request.contextPath}/qna/qnaList">qna</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/gnb/serviceCenter">faq</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/member/memberLogin">funding</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/">my planner</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/">make planner</a>
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
</script>