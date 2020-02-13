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
            <c:if test="${empty sessionScope.member}">
               <a class="nav-li nav-li-login" draggable="false"  href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
               <a class="nav-li"  href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
               <a class="nav-li nav-li-login" draggable="false"  href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
               <c:choose>
               	<c:when test="${member.grade gt 1 }">
               		<a class="nav-li nav-li-login" draggable="false"  href="${pageContext.request.contextPath}/admin/administer">관리 페이지</a>		
               	</c:when>
               	<c:otherwise>
	               <a class="nav-li nav-li-login" draggable="false"  href="${pageContext.request.contextPath}/member/memberMypage">마이페이지</a>               	
               	</c:otherwise>
               </c:choose>
            </c:if>
            <div class="nav-service-div">서비스 
               <a class="nav-service-div-a"  href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
               <a class="nav-service-div-a" href="${pageContext.request.contextPath}/qna/qnaList">qna</a>
               <a class="nav-service-div-a" href="${pageContext.request.contextPath}/gnb/serviceCenter">faq</a>
            </div>
            <a class="nav-li" href="${pageContext.request.contextPath}/funding/fundingList">펀딩</a>
            <c:if test="${not empty sessionScope.member}">
               <a class="nav-li" href="${pageContext.request.contextPath}/planner/myPlanner">나의 플래너</a>
            </c:if>
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