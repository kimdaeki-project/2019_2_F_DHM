<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="swiper-container" style=" clear: both; overflow: hidden;">
	   <div class="swiper-wrapper nolist">
	      <c:forEach items="${typeList}" var="vo" varStatus="i">
	         <div class="swiper-slide mp-li" style="height: 300px;  overflow: hidden; float: left;" onclick="./schedule/schedulePage?plNum=${vo.plNum}">
	            <a href="./schedule/schedulePage?plNum=${vo.plNum}">
	             <div class="mp-li-wrap">
	                <div class="mp-card">
	                   <div class="mp-p">
	                     <iframe src="http://localhost/planner/mapTestindex?plNum=${vo.plNum }" width="226px" height="207px" style="border: none;"></iframe>
	                      <div class="mp-info"><font style="color: #fff;">${vo.type}</font></div>
	                   </div>
	                   <div class="mp-f">
	                      <div class="mp">${vo.title}</div>
	                      <div class="mp-f1"> ${bak[i.index]} 일간</div>
	                      <div class="mp-f2"><fmt:formatDate value="${deDate[i.index] }" pattern="yy년MM월dd일"/></div>
	                      <div class="mp-f3">
	                      	<c:choose>
	                      		<c:when test="${dDay[i.index] gt 0 }">
	                      			<p style="color: blue;">D+${dDay[i.index] }</p>
	                      		</c:when>
	                      		<c:when test="${dDay[i.index] eq 0 }">
	                      			<p style="color: green;">D-Day</p>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<p style="color: red;">D${dDay[i.index] }</p>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </div>
	                   </div>
	                </div>
	             </div>
	             </a>
	         </div>
	       </c:forEach>
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