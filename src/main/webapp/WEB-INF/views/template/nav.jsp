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
			<c:if test= "${empty sessionScope.member}">				
					<a class="nav-li nav-li-login" draggable="false"   href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>						
					<a class="nav-li nav-li-login" draggable="false"   href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
			</c:if>
			<c:if test= "${not empty sessionScope.member}"> 
				<div class="nav-member-div"  onmouseenter="memOn()" onmouseleave="memOff()">
			 <c:choose>
               <c:when test="${member.memberFilesVO.fname eq null}">
                  <a><img src="../imgs/dog.jpg" style="width: 40px; height: 40px; border-radius: 50%;" ></a>               
               </c:when>
               <c:otherwise>
                  <a><img src="../imgs/member/${member.memberFilesVO.fname}" style="width: 40px; height: 40px; border-radius: 50%;"></a>
               </c:otherwise>            
            </c:choose>       
					<a  class="nav-member-div-a" href="${pageContext.request.contextPath}/member/memberMypage">${member.name}님 페이지</a>
					<a class="nav-member-div-a"  href="${pageContext.request.contextPath}/member/memberUpdate">회원정보 변경</a>
					<a  class="nav-member-div-a" href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
				</div>	
			</c:if>
				<div class="nav-service-div" onmouseenter="serOn()" onmouseleave="serOff()">서비스 
					<a class="nav-service-div-a"  href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
					<a class="nav-service-div-a" href="${pageContext.request.contextPath}/qna/qnaList">qna</a>
					<a class="nav-service-div-a" href="${pageContext.request.contextPath}/gnb/serviceCenter">faq</a>
				</div>
				 <div class="nav-funding-div" onmouseenter="funOn()" onmouseleave="funOff()">나의 펀딩 
					<a class="nav-funding-div-a"  href="${pageContext.request.contextPath}/funding/makeFundingList">모집중인 펀딩</a>
					<a class="nav-funding-div-a" href="${pageContext.request.contextPath}/funding/myFundingList">참여중인 펀딩</a>
				</div>
				<a class="nav-li" href="${pageContext.request.contextPath}/funding/fundingList">펀딩 리스트</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/planner/myPlanner">나의 플래너</a>
				<a class="nav-li" href="${pageContext.request.contextPath}/planner/makePlanner">플래너 만들기</a>
				<c:if test="${member.grade gt 5 }">
					<a class="nav-li" href="${pageContext.request.contextPath}/admin/administer">관리자 페이지</a>
				</c:if>
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

function serOn() {
	$(".nav-service-div-a").css("display","block");
}

function serOff() {
	$(".nav-service-div-a").css("display","none");
}

function funOn() {
	$(".nav-funding-div-a").css("display","block");
}

function funOff() {
	$(".nav-funding-div-a").css("display","none");
}



$('.nav-member-div').click(function(){
	$('.nav-member-div-a').toggle();
});

function memOn() {
	$(".nav-member-div-a").css("display","block");
}

function memOff() {
	$(".nav-member-div-a").css("display","none");
}
</script>