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
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<style type="text/css">
	.active{
		color: green;
	}
 	a{
		color:black;
	} 
	a:hover{
		color:green;
		font-weight: bold;
	}
</style>
</head>
<body>
   <div class="swiper-container3" style="margin-bottom: 20px; height: 600px;">
 	  <div class="swiper-wrapper">
      		<div id="back-image1" class="image swiper-slide"></div>
     		<div id="back-image2" class="image swiper-slide"></div>
      		<div id="back-image3" class="image swiper-slide"></div>
      		<div id="back-image4" class="image swiper-slide"></div>
      		<div id="back-image5" class="image swiper-slide"></div>
      </div>
   </div>
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

		<div class="row">
         <h3>다른 여행자들의 플래너 ${plannerCount}개</h3>
		  
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
                           </div>
                           </c:if>
                           </c:forEach>
                     </div>
                  </div>
		    </div>
		    
		    
		    
		  </div>
		</div>
		

      <div class="marginTop50px">
         <h3>모집중인 국내여행 펀딩</h3>
       	<div class="swiper-container2 row" style="overflow: hidden;">
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
<!--         <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div> -->
<!--          <div class="indexImgCard"> -->
<!--             <div class="indexImgCard_img"> -->
<!--                <div class="indexImgCard_img_title">title</div> -->
<!--                <div class="indexImgCard_img_text">text text text text text text text</div> -->
<!--             </div> -->
<!--          </div>/ -->
      </div>
   </div>

   </div>

  <script>

//   var images = new Array();

//   images[0] = "main1";
//   images[1] = "main2";
//   images[2] = "main3";
//   images[3] = "main4";
//   images[4] = "main5";

//   var div = new Array();

//   div[0] = "#back-image1";
//   div[1] = "#back-image2";
//   div[2] = "#back-image3";
//   div[3] = "#back-image4";
//   div[4] = "#back-image5";

//   var i = 0;

//   /* 배경화면 전환 jquery */
//   setInterval(function() {

//      $(div[i]).fadeOut(1500, function() {
//      });

//      i = i + 1;
//      if (i > 4) {
//         i = 0;
//      };

//      $(div[i]).fadeIn(1500,function() {

//         $(this).css("background-image","url(../image/"+ images[i] + ".jpg)");
//            });

//      }, 5000);


  
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
    	
    	      spaceBetween: 30,
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
    	      zoom: {
    	    	    maxRatio: 5,
    	      },
    	  
      });
    

    $(".index_buttons_li").click(function(){
        
			$(this).children(".ac").addClass("active2");
			$(this).children(".ac").removeClass("active2");
     });
    
    $(".con").click(function() {
		$(".continent-item").removeClass("active-continent");
		$(".continent-text").removeClass("active2");
		$(this).parent().parent().addClass("active-continent");
		$(this).parent().addClass("active2");
	});

  </script>
  
</body>
</html>