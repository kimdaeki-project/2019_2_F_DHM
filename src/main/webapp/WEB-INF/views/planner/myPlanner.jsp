<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
<link rel="stylesheet"  href="../css/schedule.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div style="background-color: #f5f5f5;">
   <div class="header">
   </div>
   <div class="container container2">
      <div class="main-container">
         <div class="inner-wrap">
            <div class="container">
               <h2 class="mp-title">나의 국내여행</h2>
               <div class="p-wrapper">
                  <div class="swiper-container">
                     <ul class="swiper-wrapper nolist" style=" clear: both; overflow: hidden;">
                        <c:forEach items="${list}" var="vo" varStatus="i">
                           <li class="swiper-slide mp-li" style="height: 300px; overflow: hidden; float: left;">
                           <a href="../schedule/schedulePage?plNum=${vo.plNum}">
                              <div class="mp-li-wrap">
                                 <div class="mp-card">
                                    <div class="mp-p">
                                       <iframe src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
<%--                                        <img src="http://localhost/planner/mapTest?plNum=${vo.plNum }" width="256px" height="205px"> --%>
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
                           </c:forEach>
                           
                     </ul>
                  </div>
               
               </div>
            </div>
         </div>
      
      </div>
   </div>

</div>
<script type="text/javascript">


   var swiper = new Swiper('.swiper-container', {
         slidesPerView: 5,
         spaceBetween: 0,
         pagination: {
           el: '.swiper-pagination',
           clickable: true,
         },
       });
</script>
</body>
</html>