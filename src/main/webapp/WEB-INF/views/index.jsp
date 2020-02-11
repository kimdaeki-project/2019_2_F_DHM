<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<c:import url="./member/membercss.jsp"/>
<meta charset="UTF-8">
<title>DHM Planner</title>
<c:import url="./template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
 <link rel="stylesheet"  href="../css/schedule.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

</head>
<body>
<c:import url="./template/nav.jsp"/>
   <div class="container" style=" padding-bottom: 200px;">
      	<img class="mainimage" src="../images/mainimage2.jpg">
      <div class="jumbotron marginTop50px" style="width: 55%; float: left; margin-left: 20px;">
         <h3>DHM플래너로 대한민국 곳곳을 여행해보세요.</h3>
         <p>맞춤 여행 추천과 플래너 작성을 통해 보다 효율적인 여행을 계획해보세요!</p>
         <div class="main_planner_btn_div">
            <input type="button" class="main_planner_btn_diy" value="DIY">
            <input type="button" class="main_planner_btn_request" value="request">
         </div>
      </div>
      <div class="marginTop50px" style="clear: both;">

		<div class="container">
         <h3>다른 여행자들의 플래너 ${plannerCount}개</h3>
		  
		  <ul class="nav nav-tabs">
		      <li class="index_buttons_li index_buttons_li"><a  data-toggle="tab"  href="#home">최신</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu1">아이들과</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu2">커플/신혼</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu3">부모님과</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu4">남자혼자</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu5">여자혼자</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu6">여자끼리</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu7">남자끼리</a></li>
               <li class="index_buttons_li"><a data-toggle="tab"  href="#menu8">남녀그룹</a></li>
		  </ul>
		
		  <div class="tab-content">
		    <div id="home" class="tab-pane fade in active">
		    	<div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                             <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    <div id="menu1" class="tab-pane fade">
		       <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '아이들과' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    <div id="menu2" class="tab-pane fade">
		       <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '커플/신혼' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    <div id="menu3" class="tab-pane fade">
		      <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '부모님과' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    
		    
		    <div id="menu4" class="tab-pane fade">
		      <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '남자혼자' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    
		    
		    <div id="menu5" class="tab-pane fade">
		      <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '여자혼자' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    
		    
		    <div id="menu6" class="tab-pane fade">
		      <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '여자끼리' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    
		    
		    <div id="menu7" class="tab-pane fade">
		      <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '남자끼리' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    
		    
		    <div id="menu8" class="tab-pane fade">
		      <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '남녀함께' }">
                           <li class="swiper-slide mp-li" style="height: 300px;  overflow: hidden;float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum}" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
                                       <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.title}</div>
                                       <div class="mp-f1"> ${days[i.index]} 일간</div>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
                           </a>
                           </li>
                           </c:if>
                           </c:forEach>
                     </ul>
                  </div>
		    </div>
		    
		    
		    
		  </div>
		</div>
		

      <div class="marginTop50px">
         <h3>모집중인 국내여행 펀딩</h3>
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

   

  <script>
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 5,
        spaceBetween: 1,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
      });
  </script>
  
</body>
</html>