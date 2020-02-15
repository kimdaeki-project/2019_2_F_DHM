<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/imgs/logos/logo-fav.ico">
<!-- boot.jsp jquery만 가져옴 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../../css/membercss.css">
<link rel="stylesheet"  href="../../css/basic.css">
 <link rel="stylesheet" href="../../package/css/swiper.min.css">
<meta charset="UTF-8">
	<c:import url="../../template/nav.jsp"/>
</head>
<body>
	
	<div class="idpwmain">
		<div class="idpwmain2">
		
			<div class="idpwmain3">
				<div class="idpwmain3-1">ID / PW 찾기</div>
			</div>
			
			<div class="idpwmain4"><!-- main box -->
				<div class="idpwmain4-1">
					<div class="idpwmain4-1-1">아이디 찾기</div>
				</div>
			<!-- 이메일1 입력창 -->
			<form action="memberEMAIL2Check"  id="memberCheckPage" method="post">
				<div class="idpwmain4-2">
					<div class="idpwmain4-2-1">
						<div class="idpwmain4-2-2">이메일 주소 : </div>
					</div>
				</div>
			
				<div class="idpwmain4-3">
					<input type="text" class="idpwmain4-3-1" id="hellofafa" name="emailCheck">					
					<div class="idpwmain4-3-2">찾기</div>
				</div>
			</form>
			<!-- 이메일1 입력창----------- -->				 
			</div>
			
			<!-- ------------------------------------------------------------ -->	
			<div class="idpwmain5">
				<div class="idpwmain5-1">
					<div class="idpwmain5-1-1">비밀번호 재발급</div>
				</div>
				<div class="idpwmain6-2">
					<div class="idpwmain6-2-1">
						<div class="idpwmain6-2-2">아이디 : </div>
					</div>
				</div>			
			<!-- 아이디1 입력창 -->
				<div class="idpwmain6-3">
					<input type="text" class="idpwmain6-3-1" id="hellomama" >
				</div>
			<!-- 아이디1 입력창 -->	
				<div class="idpwmain5-2">
					<div class="idpwmain5-2-1">
						<div class="idpwmain5-2-2">이메일 주소 : </div>
					</div>
				</div>			
			<!-- 이메일2 입력창 -->	
				<div class="idpwmain5-3">
					<input type="text" class="idpwmain5-3-1" id="hellomama2">
					<div class="idpwmain5-3-2">발급</div>
				</div>
			<!-- 이메일2 입력창 -->
				
			</div>			
		</div>
	</div>
	
	<div class="idpwmainbox2"></div>
	

	<c:import url="../../template/footer.jsp"/>
	<!--ID 찾기 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid2" style="">
		<div id="emailsame" style="position: fixed; top: 125px; left:780px; background-color: #fff; height: 80px; width: 270px;">
			<div style="background-color: #63caf8; height: 70px; width: 260px; margin-left: 5px; margin-top: 5px;">
				<div class="hellomother" style="color: white; font-size: 13pt; width: 240px; padding-left: 15px; padding-top: 20px;">
				<span id="findID" style="margin-left: -15px;"></span></div>
			</div>
		</div>
	
		<div class="Xidsame5" style= " position: fixed; background-color: #fff; top: 110px; left: 1030px; height: 50px; width: 50px;"> 
			<div class="Xidsame4" style="background-color: #63caf8; height: 40px; width: 40px; 
				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>
	
	<!--PW 찾기------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid3" style="">
		<div id="emailsame2" style="position: fixed; top: 125px; left:780px; background-color: #fff; height: 80px; width: 270px;">
			<div style="background-color: #63caf8; height: 70px; width: 260px; margin-left: 5px; margin-top: 5px;">
				<div class="hellomother2" style="color: white; font-size: 13pt; width: 240px; padding-left: 15px; padding-top: 20px;">
				<span id="findPW" style="margin-left: -15px;"></span></div>
			</div>
		</div>
	
		<div class="Xidsame9" style= " position: fixed; background-color: #fff; top: 110px; left: 1030px; height: 50px; width: 50px;"> 
			<div class="Xidsame8" style="background-color: #63caf8; height: 40px; width: 40px; 
 				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>

</body>
<script type="text/javascript">
//click box----------------------------------------------------------------------
$("#Xid2").hide(); //정상 상자 숨기
$('#Xid3').hide(); //오류 상자 숨기

$(".Xidsame4").click(function(){

	$("#Xid2").hide();

	$(".idpwmain4-3-2").css("background","#e74c3c");

});

$(".Xidsame8").click(function(){

	$("#Xid3").hide();

	$(".idpwmain5-3-2").css("background","#e74c3c");

});
//----------------------------------------------------------------------
//아이디 찾기----------------------------------------------------------------
//email 입력창
$(document).ready(function (){
	
    $('.idpwmain4-3-1').focus(function() {
        $('.idpwmain4-2-2').css('color','#63caf8');
        $('.idpwmain4-2-2').css('font-weight','bold');     
    	});
	
    $('.idpwmain4-3-1').blur(function(){
       	 $('.idpwmain4-2-2').css('color','gray');
       	$('.idpwmain4-2-2').css('font-weight','normal'); 
   		});
 
});
//이름 입력창
$(document).ready(function (){
	
    $('.idpwmain7-3-1').focus(function() {
        $('.idpwmain7-2-2').css('color','#63caf8');
        $('.idpwmain7-2-2').css('font-weight','bold');     
    	});
	
    $('.idpwmain7-3-1').blur(function(){
       	$('.idpwmain7-2-2').css('color','gray');
       	$('.idpwmain7-2-2').css('font-weight','normal'); 
   		});
 
});

//비밀번호 재발급----------------------------------------------------------------
//아이디 입력창
$(document).ready(function (){
	
    $('.idpwmain6-3-1').focus(function() {
        $('.idpwmain6-2-2').css('color','#63caf8');
        $('.idpwmain6-2-2').css('font-weight','bold');     
    	});
	
    $('.idpwmain6-3-1').blur(function(){
       	 $('.idpwmain6-2-2').css('color','gray');
       	$('.idpwmain6-2-2').css('font-weight','normal'); 
   		});
 
});
//이메일 입력창
$(document).ready(function (){
	
    $('.idpwmain5-3-1').focus(function() {
        $('.idpwmain5-2-2').css('color','#63caf8');
        $('.idpwmain5-2-2').css('font-weight','bold');     
    	});
	
    $('.idpwmain5-3-1').blur(function(){
       	$('.idpwmain5-2-2').css('color','gray');
       	$('.idpwmain5-2-2').css('font-weight','normal'); 
   		});
 
});

//ID 찾기  start----------------------------------------------------------------
var email = $("#hellofafa").val();

$(".idpwmain4-3-2").click(function(){

email = $("#hellofafa").val();
	
	$.ajax({

		type : "POST",
		url  : "memberEMAIL2Check",
		data : {
			email : email
			},
		success : function(getid){
			//성공창
			if(getid != ""){
 				$(".idpwmain4-3-2").css("background","#95a5a6");
 				$(".hellomother").css("text-align","center");	
				$('#findID').text(getid);				
 				$('#Xid2').show(); 
			}
		}//success문
	});	//ajax문

}); //function문
//ID찾기  end----------------------------------------------------------------

//PW 찾기  start----------------------------------------------------------------
var id = $("#hellomama").val();
var email2 = $("#hellomama2").val();



$(".idpwmain5-3-2").click(function(){
	id = $("#hellomama").val();
	email2 = $("#hellomama2").val();
	
	$.ajax({
		type : "POST",
		url  : "memberEMAIL3Check",
		data : {
			id : id,
			email : email
			},
		success : function(getpw){
			//성공창
			if(getpw != ""){
 				$(".idpwmain5-3-2").css("background","#95a5a6");
 				$(".hellomother2").css("text-align","center");	
 				$('#findPW').text(getpw);					
 				$('#Xid3').show(); 
			}
		}//success문
	});	//ajax문

}); //function문
//PW 찾기  end----------------------------------------------------------------

//enter키 막기
//방법1
document.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
}, true);
</script>
</html>