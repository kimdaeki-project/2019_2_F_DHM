<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<!-- 버튼 bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../css/basic.css">
<link rel="stylesheet" href="../package/css/swiper.min.css">
<link rel="stylesheet"  href="../css/membercss.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<c:import url="../template/nav.jsp"/>

	<div class="getoutmain">
		<div class="maintext1"><br><h2 class="maintext1">회원 탈퇴하기</h2></div>
		<div class="maintext2"><h4 class="maintext2">탈퇴 시 유의사항</h4></div>
		<div class="maintext3">
			1. 탈퇴하시면 지금까지 작성하신 여행계획에 단 댓글은 자동으로 삭제됩니다.<br>
			2. 작성하신 여행계획은 탈퇴전에 직접 [<a href="${pageContext.request.contextPath}/" target="blank">내여행리스트</a>]에서 삭제해주시기 바랍니다. 삭제방법은 각 여행플래너에서 상단 제목우측에 삭제버튼을 누르시면 됩니다.<br>
			3. [<a href="${pageContext.request.contextPath}/member/memberMypage" target="blank">광장</a>]에 쓰신 글들과 댓글은 자동으로 삭제되지 않으므로 직접 삭제해주시기 바랍니다.<br>
			4. 여행정보와 현지교통과 관련해 집필하신 지식글들은 자동으로 삭제되지 않습니다.</div>
	</div>
	
	<div style="z-index: 9999; width: 800px; height: 2px; border-bottom: 1px solid rgba(0,0,0,.1);margin-left: 400px; margin-top: 110px;"></div>
	
	<spring:form action="memberGetout" id="Getout" method="post" modelAttribute="memberVO" >
	<div class="getoutmain1">
		<div class="getoutmain1-1">
			비밀번호 : <input type="password" class="getoutmain1-2" id="pw10" name="pw">			
					<button type="button" id="ppw_btn" class="btn-u btn-u-red"
				style="margin-left: -5px; margin-top: 19px; width: 70px; height: 25px; background-color: #e74c3c; color: white; line-height: 3px;">확인</button>
					
					<input type="hidden" value="${member.id}" name="id">
					<input type="hidden" value="${member.name}" name="name">
					<input type="hidden" value="${member.email}" name="email">
					<input type="hidden" value="${member.gender}" name="gender">
					<input type="hidden" value="${member.birth}" name="birth">
		</div>
		<div>
			<div class="getoutmain1-3">탈퇴하기</div>
			<div class="getoutmain1-4">취소</div>
		</div>
	</div>
	</spring:form>
	
	<div class="getoutmain2">
		<div class="getoutmain2-1">
			<b>(주)DHM플래너</b> 사업자번호: 02-1577-1577 / 대표: 흥선대원군<br>
			서울특별시 종로구 세종로 1 (DHM플래너)<br>
			대표번호 : +82-2-1577-1577 | 대표이메일 : dhmteam@gmail.com<br>
			운영시간(한국) 11:00 ~ 19:00, 주말/공휴일은 제외.<br>
			DHM플래너는 광고서비스 제공자/예약 시스템의 공급자이며 통신판매의 당사자가 아닙니다. 따라서 DHM플래너는 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.<br>
			2020 © DHMPLANNER. ALL Rights Reserved. 광고/제휴 문의     서비스 문의     개인정보 취급방침     이용약관    광고서비스 이용약관<br>
		</div>
	</div>


<!-- PW 중복확인 DIV --------------------------------------------------------------------------------------------------------------------------->
	<!--오류사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid" style="">
		<div id="idsame" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">비밀번호를 다시 입력하십시오.</div>
			</div>
		</div>
	
		<div class="Xidsame3" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame2" style="background-color: #64db99; height: 40px; width: 40px; 
  				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div>  
		</div>
	</div>
	
	<!--정상사항 ---------------------------------------------------------------------------------------------------------------------------------- -->
	<div id="Xid1" style="">
		<div id="idsame2" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">올바른 비밀번호입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame7" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame6" style="background-color: #64db99; height: 40px; width: 40px; 
   				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>

	<div style="height: 100px;"></div>
</body>


<footer>
   <c:import url="../template/footer.jsp"/>

</footer>

<%-- 			<c:import url="../template/footer.jsp"/> --%>
<script type="text/javascript">
//-----------------------------------------------------------------------
//회원 탈퇴 취소 -> 마이페이지로 이동
$(".getoutmain1-4").click(function(){
	
    location.href = "memberMypage";
     	 
	});
//----------------------------------------------------------------------

// var pw = $("#pw10").val();   : 비밀번호 입력값
// var pw2 = '${member.pw}';	: DB 비밀번호 불러오는 값
//#ppw_btn 						: 확인 버튼 아이디
//#pw10 						: 비밀번호 입력 아이디
//#getoutmain1-3 				: 저장버튼

//----------------------------------------------------------------------

	$('#Xid1').hide(); //입력 성공 상자 숨기
	$('#Xid').hide();  //입력 오류 상자 숨기

//+++++++++++++++++++++++++++++++++++++++++++++++++
	var check3=false;
	var pw = $("#pw10").val();
	var pw2 = '${member.pw}';

	//입력 성공 상자 닫기 버튼	
	$(".Xidsame6").click(function(){
		$("#Xid1").hide();	
	 	$("#ppw_btn").css("background","#e74c3c");	
	});
	
	//입력 오류 상자 닫기 버튼	
	$(".Xidsame2").click(function(){	
		$("#Xid").hide();	
		$("#ppw_btn").css("background","#e74c3c");	
	});

	//클릭시 체크값
	$("#ppw_btn").click(function(){	
		check3 = $('#ppw_btn').is(':checked');
	});

//+++++++++++++++++++++++++++++++++++++++++++++++++
	$(".getoutmain1-3").click(function(){

		pw = $("#pw10").val();
		pw2 = '${member.pw}';


		if(check3 == false){
			alert("[oberlap] 비밀번호 확인 해주시기 바랍니다.");
			
		}else{

		        document.getElementById('Getout').submit();        
		    		
			}
	});

//+++++++++++++++++++++++++++++++++++++++++++++++++

	$("#ppw_btn").click(function(){

		pw = $("#pw10").val();
		pw2 = '${member.pw}';
		
		 if(pw != pw2){	
			 $("#ppw_btn").css("background","#95a5a6");	
			 $("#Xid").show();		
				 
			}
			if(pw == pw2){

				$("#ppw_btn").css("background","#95a5a6");
				check3 = true;
				$("#Xid1").show();

			}	
	}); //function문
//----------------------------------------------------------------------
//enter키 막기
//방법1
document.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
}, true);

//방법0(예시)
// $('input[type="text"]').keydown(function() {
// 	  if (event.keyCode === 13) {
// 	    event.preventDefault();
// 	  };
// 	});
	
</script>
</html>