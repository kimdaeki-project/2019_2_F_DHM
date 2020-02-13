<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
   <div class="nav-contain row">
   <button class="m-title">dhm planner</button>
      <div class="nav-logoWrapper"><a href="${pageContext.request.contextPath}/"><img alt="logo" src="${pageContext.request.contextPath}/imgs/logos/logo-blue.png" class="nav-logoWrapper-img" ></a></div>
      <div class="nav-menuWrapper">
         <div class="nav-menu-ul">
            <a class="nav-li nav-li-login" draggable="false"  href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
            <a class="nav-li"  href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>
            <div class="nav-service-div">서비스
               <a class="nav-service-div-a"  href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
               <a class="nav-service-div-a" href="${pageContext.request.contextPath}/qna/qnaList">qna</a>
               <a class="nav-service-div-a" href="${pageContext.request.contextPath}/gnb/serviceCenter">faq</a>
            </div>
            <a class="nav-li" href="${pageContext.request.contextPath}/member/memberLogin">펀딩</a>
            <a class="nav-li" href="${pageContext.request.contextPath}/planner/myPlanner">나의 플래너</a>
            <a class="nav-li" href="${pageContext.request.contextPath}/planner/makePlanner">플래너</a>
         </div>
      </div>
   </div>
</nav>

<script type="text/javascript">



function serviceChoose(){
//   alert('ll');
   $('.service_ul').toggleClass("displayBlock");
}


</script>