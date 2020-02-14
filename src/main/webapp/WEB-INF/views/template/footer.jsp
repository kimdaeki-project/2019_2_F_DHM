<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"  href="../css/basic.css">
<footer>

	<div class="footermain1">
		<div class="footermain1-1">
			<div class="foot1">
				<div class="textline click1">광고/제휴문의</div>
			</div>
			<div class="foot2">
				<div class="textline  click2">서비스문의</div>
			</div>
			<div class="foot3">
				<div class="textline  click3">개인정보 취급방침</div>
			</div>
			<div class="foot4">
				<div class="textline  click4">이용약관</div>
			</div>
			<div class="foot5">
				<div class="textline  click5">여행자약관</div>
			</div>
			<div class="foot6">
				<div class="textline2  click6">가이드약관</div>
			</div>
			<div class="foot7">				
					<div class=""></div>
					<div class=""></div>
					<div class=""></div>
					<div class=""></div>
			</div>
		</div>
	</div>


	<div class="footermain2">
		<div class="footermain2-1">
			<div class="footermain2-1-1"><img src="${pageContext.request.contextPath}/imgs/logos/hello.png" class="plannerimg">
			</div>
			
			<div class="footermain2-1-2">
				<div class="text1">
					<div class="text1-1">(주)DHM스피어리언스 </div>
					<div class="text1-2">대표 : 흥선대원군 </div>
					<div class="text1-3">사업자등록번호 : 635-99-11211</div>
				</div>
				
				<div class="text2">
					<div class="text2-1">고객센터 : 02-5959-5959 </div>
					<div class="text2-2">대표 : 흥선대원군 </div>
					<div class="text2-3">사업자등록번호 : 635-81-11211</div>				
				</div>
				
				<div class="text3">			
					<div class="text3-1">주소 : 서울특별시 흥선구 흥선대로 1 DHM 비서실</div>
					<div class="text3-2">통신판매업 신고 : (+82) 02-730-5800</div>
				</div>
			</div>
		
			<div class="footermain2-1-3">
			자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있습니다. DHM익스피어리언스는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
			따라서 DHM익스피어리언스는 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
	
			</div>
		</div>
	</div>
</footer>

<script type="text/javascript">
	$(".plannerimg").click(function(){

	location.href = "/";
	 
	});
//----------------------------------------------------------------------
	//footer script
	
	$(".click2").click(function(){
	    window.open('/', '_blank'); 
	    	 
		});
	
	
	$(".click3").click(function(){
	    window.open('memberUsePage/memberPrivacyPolicy', '_blank'); 
	    	 
		});

	$(".click4").click(function(){
		 window.open('memberUsePage/memberTermsAndConditions', '_blank'); 
		 	     	 
		});

	$(".click5").click(function(){
	    window.open('memberUsePage/memberTravelReservation', '_blank'); 
	    	 
		});

	$(".click6").click(function(){
		 window.open('memberUsePage/memberGuideTermsandConditions', '_blank'); 
		 	     	 
		});	



</script>
</html>