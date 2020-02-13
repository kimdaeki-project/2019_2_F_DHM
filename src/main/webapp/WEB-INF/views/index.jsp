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
  <link rel="stylesheet"  href="../css/funding.css">
  <link rel="icon" href="../imgs/logos/logo-fav.ico">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<style type="text/css">
	.active{
		color: #18A8F1;
	}
 	a{
		color:black;
	} 
	a:hover{
		color:#18A8F1;
		font-weight: bold;
	}
</style>
</head>
<body>
<c:import url="./template/nav.jsp"/>
   <div class="swiper-container3" style="margin-bottom: 20px; height: 600px; width: 100%;">
 	  <div class="swiper-wrapper" style="width: 100%;">
      		<div id="back-image1" class="image swiper-slide">
      			<div class="backTitle">경상북도 경주 동궁과월지</div>
      		</div>
     		<div id="back-image2" class="image swiper-slide">
     			<div class="backTitle">부산광역시 광안리해수욕장</div>
     		</div>
      		<div id="back-image3" class="image swiper-slide">
      			<div class="backTitle">경상남도 진해 군항제</div>
      		</div>
      		<div id="back-image4" class="image swiper-slide">
      			<div class="backTitle">서울특별시 광화문광장</div>
      		</div>
      		<div id="back-image5" class="image swiper-slide">
      			<div class="backTitle">서울특별시 강남</div>
      		</div>
      		<div id="back-image6" class="image swiper-slide">
      			<div class="backTitle">전라북도 전주 한옥마을</div>
      		</div>
      		<div id="back-image7" class="image swiper-slide">
      			<div class="backTitle">전라남도 담양 메타세콰이어길</div>
      		</div>
      		<div id="back-image8" class="image swiper-slide">
      			<div class="backTitle">충청북도 단양 패러글라이딩</div>
      		</div>
      		<div id="back-image9" class="image swiper-slide">
      			<div class="backTitle">강원도 강릉시 안반데기</div>
      		</div>
      		<div id="back-image10" class="image swiper-slide">
      			<div class="backTitle">제주특별자치시 광치기해변</div>
      		</div>
      </div>
   </div>

   <div class="container">
      	<img class="mainimage" src="../images/mainimage2.jpg">
      <div class="row">
	      <div class="jumbotron marginTop50px" style="width: 743px; float: left; margin-left: 20px;">
	         <h3>DHM플래너로 대한민국 곳곳을 여행해보세요.</h3>
	         <p>맞춤 여행 추천과 플래너 작성을 통해 보다 효율적인 여행을 계획해보세요!</p>
	         <div class="main_planner_btn_div">
	            <input type="button" class="main_planner_btn_diy" value="DIY">
	            <input type="button" class="main_planner_btn_request" value="FUNDING">
	         </div>
	      </div>
      </div>
      <div class="marginTop50px" style="clear: both;">

		<div class="row">
         <h3 class="contitle">다른 여행자들의 플래너 ${plannerCount}개</h3>
		  
		  <ul class="nav nav-tabs">
		      <li class="index_buttons_li index_buttons_li"><a class="ac" data-toggle="tab"  href="#home">최신</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu1">아이들과</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu2">커플/신혼</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu3">부모님과</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu4">남자혼자</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu5">여자혼자</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu6">여자끼리</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu7">남자끼리</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#menu8">남녀그룹</a></li>
		  </ul>
		
		  <div class="tab-content">
		    <div id="home" class="tab-pane fade in active">
		    	<div class="swiper-container" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist" >
                        <c:forEach items="${newPlanner}" var="vo" varStatus="i">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                         </c:forEach>
                     </div>
                  </div>
		    </div>
		    <div id="menu1" class="tab-pane fade">
		       <div class="swiper-container"  style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '아이들과' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                         </c:forEach>
                     </div>
                  </div>
		    </div>
		    <div id="menu2" class="tab-pane fade">
		       <div class="swiper-container"  style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '커플/신혼' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    <div id="menu3" class="tab-pane fade">
		      <div class="swiper-container" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist" >
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '부모님과' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    
		    
		    <div id="menu4" class="tab-pane fade">
		      <div class="swiper-container" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist" >
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '남자혼자' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    
		    
		    <div id="menu5" class="tab-pane fade">
		      <div class="swiper-container" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '여자혼자' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    
		    
		    <div id="menu6" class="tab-pane fade">
		      <div class="swiper-container" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist" >
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '여자끼리' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    
		    
		    <div id="menu7" class="tab-pane fade">
		      <div class="swiper-container"  style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist">
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '남자끼리' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    
		    
		    <div id="menu8" class="tab-pane fade">
		      <div class="swiper-container" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper nolist" >
                        <c:forEach items="${typelist}" var="vo" varStatus="i">
                           <c:if test="${vo.type eq '남녀함께' }">
                           <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden;float: left;">
                           <a href="./schedule/schedulePage?plNum=${vo.plNum}">
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    
		    
		    
		  </div>
		</div>
		
	<div class="row">
      <div class="marginTop50px">
         <h3 class="contitle">모집중인 펀딩여행</h3>
       	<div class="swiper-container2" style="overflow: hidden;">
        	<div class="funding_block swiper-wrapper">
        		 <c:forEach items="${fundinglist }" var="vo">
				<div class="funding_block2 swiper-slide">
					<div class="funding_block3">
						<div class="funding_inner_area">
						<a href="./funding/fundingSelect?num=${vo.num}">
				
						  <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum}" width="226px" height="207px" style="border: none;"></iframe>
									<%--   <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
								<%-- <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div> --%>
                                    </div>
                                    <div class="mp-f">
                                       <div class="mp">${vo.name}</div>
								<%-- <div class="mp-f1"> ${days[i.index]} 일간</div> --%>
                                       <div class="mp-f2"><%-- <fmt:formatDate value="${vo.deDate}" pattern="yy년MM월dd일"/> --%>출발</div>
                                       <div class="mp-f3">D-16</div>
                                    </div>
                                 </div>
                              
                              </div>
						</a>
				
				
<%-- 				<img class="funding_img" src="../test_img/test${i.index}.jpg"></a> --%>
						</div>
					</div>
					<div class="funding_inner_area2">
						<div class="funding_start">
							<span class="glyphicon glyphicon-calendar"></span>
							${vo.restTime} 일 남았어요!
						</div>
						<div class="funding_bar">
							<div class="funding_bar2" style="width: ${vo.gage}%;min-width: 0%;background: rgb(250, 100, 98);transition-duration: 200ms;height: 2px;"></div>
						</div>
						<div class="funding_start" style="float: right; padding-right: 1em">
							${vo.gage}%
						</div>
						<div  class="funding_start" style="float: left; padding-right: 1em">
							현재 모인 금액 : ${vo.status}원
						</div>
					</div>
				</div>
         			</c:forEach>
			</div>
         </div>
      </div>
   </div>
   
   <div class="row">
      <div class="marginTop50px">
         <h3 class="contitle">2월, 축제속으로</h3>
         	<ul class="nav nav-tabs">
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"   href="#f0">서울</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#f1">인천</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#f2">대구</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#f3">강원도</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#f4">부산</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#f5">경기도</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#f6">제주도</a></li>
               <li class="index_buttons_li"><a class="ac" data-toggle="tab"  href="#f7">전라북도</a></li>
		  </ul>
         
         <div class="tab-content">
		    <div id="f0" class="tab-pane fade in active">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_seoul}" var="fe" varStatus="i">
               
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
							
                         </c:forEach>
                     </div>
                  </div>
		    </div>
        
		    <div id="f1" class="tab-pane fade in">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_incheon}" var="fe" varStatus="i">
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
                         </c:forEach> 
                     </div>
                  </div>
		     </div>
		     
		      <div id="f2" class="tab-pane fade in">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_daegu}" var="fe" varStatus="i">
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
                         </c:forEach> 
                     </div>
                  </div>
		     </div>
		     
		      <div id="f3" class="tab-pane fade in">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_gangwon}" var="fe" varStatus="i">
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
                         </c:forEach> 
                     </div>
                  </div>
		     </div>
		     
		      <div id="f4" class="tab-pane fade in">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_busan}" var="fe" varStatus="i">
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
                         </c:forEach> 
                     </div>
                  </div>
		     </div>
		     
		      <div id="f5" class="tab-pane fade in">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_kyungi}" var="fe" varStatus="i">
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
                         </c:forEach> 
                     </div>
                  </div>
		     </div>
		     
		      <div id="f6" class="tab-pane fade in">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_jeju}" var="fe" varStatus="i">
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
                         </c:forEach> 
                     </div>
                  </div>
		     </div>
		     
		      <div id="f7" class="tab-pane fade in">
		    	<div class="swiper-container4" style=" clear: both; overflow: hidden;">
                     <div class="swiper-wrapper" >
                        <c:forEach items="${festival_jrbd}" var="fe" varStatus="i">
                           <div style="width: 200px;"class="swiper-slide">
								<div style="position: relative; margin: 0 auto;">									
									<div class="img-wrap" style="width: 0px;"><img class="wish-img" alt="여행사진" src="${fe.firstimage}"></div>
								</div>
								<div>
									<div style="padding: 3px; width: 80%;float: left;">
										<div class="i-card-title">${fe.title}</div>
										<div class="addr">${fe.addr1 }</div>
									</div>
									<div style="width: 20%; float: left; padding-top: 10px">
										<a onclick="clickinfo('${fe.title}')">
											<i class="fa fa-info-circle" style="color: gray; font-size: 23px;"></i>
										</a>
									</div>
								</div>	 
							</div>
                         </c:forEach> 
                     </div>
                  </div>
		     </div>
         </div>
   </div>
   
   <div class="row">
      <div class="marginTop50px">
         <h3 class="contitle">여행자들의 베스트 리뷰</h3>
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

    var swiper = new Swiper('.swiper-container2', {
        slidesPerView: 5,
        spaceBetween: 1,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
      });

    var swiper = new Swiper('.swiper-container3', {
    	
    	      spaceBetween: 50,
    	      centeredSlides: true,
    	      autoplay: {
    	        delay: 3500,
    	        disableOnInteraction: false,
    	      },
    	      pagination: {
    	        el: '.swiper-pagination',
    	        clickable: true,
    	      },
    	      navigation: {
    	        nextEl: '.swiper-button-next',
    	        prevEl: '.swiper-button-prev',
    	      },
    	    
      });
    var swiper = new Swiper('.swiper-container4', {
        slidesPerView: 6,
        spaceBetween: 2,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
      });

    $(".index_buttons_li").click(function(){
        
			$(this).children(".ac").addClass("active2");
			$(this).children(".ac").removeClass("active2");
     });
    


  </script>
  
</body>
</html>