<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="../css/membercss.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
 <link rel="stylesheet" href="../package/css/swiper.min.css">

</head>
<body>

<div class="container" style="height: 100px;"></div>

<h1 style="text-align: center;">DHM 홈페이지</h1>

<div style="padding-left: 780px;">
   <a href="#"><img src="./imgs/5.png"></a>
</div>

<div class="container" style="height: 200px;"></div>

<div style="padding-left: 760px;">
   <c:if test= "${not empty member}"> 
   	<a href="${pageContext.request.contextPath}/member/memberLogout"><button>로그아웃</button></a>
   	<a href="${pageContext.request.contextPath}/member/memberMypage"><button>마이 페이지</button></a>
   	<a href="${pageContext.request.contextPath}/member/memberUpdate"><button>내 정보 수정</button></a>
   </c:if>
   <c:if test= "${ empty member}"> 
   	<a href="${pageContext.request.contextPath}/member/memberLogin"	><button>로그인</button></a>
   	<a href="${pageContext.request.contextPath}/member/memberJoin"><button>회원가입</button></a>   
   	<a href="${pageContext.request.contextPath}/member/memberFacebookLogin"><button>페이스북 로그인</button></a>
   </c:if>
   	<a href="${pageContext.request.contextPath}/planner/makePlanner"><button>플래너만들기</button></a>
   	<a href="${pageContext.request.contextPath}/planner/myPlanner"><button>내 플래너</button></a>
</div>



<c:import url="./template/nav.jsp"/>
   <div class="container" style=" padding-bottom: 200px;">
      <div class="jumbotron marginTop50px">
         <h3>스투비플래너로 상상속 유럽여행을 현실로 만들어 보세요.</h3>
         <p>855,014명의 유럽계획 데이터를 활용한 추천과 시뮬레이션 기능을 활용해 여행 아이디어를 실제 여행으로 만들어 예상 비용과 소요시간을 계산해 보세요.</p>
         <div class="main_planner_btn_div">
            <input type="button" class="main_planner_btn_diy" value="DIY">
            <input type="button" class="main_planner_btn_request" value="request">
         </div>
      </div>
      <div class="marginTop50px">
         <h3>다른 여행자들의 플래너 855,014개</h3>
<!--           <div class="swiper-container"> -->
<!--     <div class="swiper-wrapper"> -->
<!--       <div class="swiper-slide">Slide 1</div> -->
<!--       <div class="swiper-slide">Slide 2</div> -->
         <div class="index_buttons swiper-container swiper-container-horizontal swiper-container-free-mode">
            <ul class="index_buttons_ul swiper-wrapper">
               <li class="index_buttons_li swiper-slide index_buttons_li swiper-slide_active ">최신</li>
               <li class="index_buttons_li swiper-slide"><a>최신</a></li>
               <li class="index_buttons_li swiper-slide"><a>아이들과</a></li>
               <li class="index_buttons_li swiper-slide"><a>커플/신혼</a></li>
               <li class="index_buttons_li swiper-slide"><a>부모님과</a></li>
               <li class="index_buttons_li swiper-slide">남자혼자</li>
               <li class="index_buttons_li swiper-slide">여자혼자</li>
               <li class="index_buttons_li swiper-slide">여자끼리</li>
               <li class="index_buttons_li swiper-slide">남자끼리</li>
               <li class="index_buttons_li swiper-slide">남녀그룹</li>
                     <!--밑에는 지우는거 -->
               <li class="index_buttons_li swiper-slide">남자혼자</li>
               <li class="index_buttons_li swiper-slide">여자혼자</li>
               <li class="index_buttons_li swiper-slide">여자끼리</li>
               <li class="index_buttons_li swiper-slide">남자끼리</li>
               <li class="index_buttons_li swiper-slide">남녀그룹</li>
            </ul>
         </div>
         <div class="index_samplePlanner">
            <div class="samplePlannerCard">
               <div class="samplePlannerCard_map">map</div>
               <div class="samplePlannerCard_info">map info</div>
            </div>
            <div class="samplePlannerCard">
               <div class="samplePlannerCard_map">map</div>
               <div class="samplePlannerCard_info">map info</div>
            </div>
            <div class="samplePlannerCard">
               <div class="samplePlannerCard_map">map</div>
               <div class="samplePlannerCard_info">map info</div>
            </div>
            <div class="samplePlannerCard">
               <div class="samplePlannerCard_map">map</div>
               <div class="samplePlannerCard_info">map info</div>
            </div>
         </div>
      </div>
      <div class="marginTop50px">
         <h3>유럽 현지투어 얼리버드 & 결합 SALE</h3>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
         <div class="indexImgCard">
            <div class="indexImgCard_img">
               <div class="indexImgCard_img_title">title</div>
               <div class="indexImgCard_img_text">text text text text text text text</div>
            </div>
         </div>
      </div>
   </div>
   <div style="height: 100px;"></div>
   
    <script src="../package/js/swiper.min.js"></script>
    <script>
    var swiper = new Swiper('.swiper-container');
  </script>
  
</body>
</html>