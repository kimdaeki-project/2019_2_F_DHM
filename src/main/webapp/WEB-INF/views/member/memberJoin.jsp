<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<!-- boot.jsp jquery만 가져옴 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="./membercss.jsp"/>
<meta charset="UTF-8">
<title>member Join</title>
</head>
<body>
	<div class="Joinmain">
		<div class="JoinMainPage">
			<div class="Join1">
				<div class="Join1-1">회원가입 with FACEBOOK</div>
			</div>
			
			<div class="Join2">
				<a href="#"><img class="Join2img" src="../imgs/facebooklogin.png"></a>
			</div>
			
			<div class="Join3">
				<div class="Join3-1">회원가입/정보변경</div>
			</div>
		<spring:form action="memberJoin" id="frm2" method="post" modelAttribute="memberVO">	
			<div class="Join4">
				<div class="Join4-1-a">
					<div class="Join4-1-1">이름</div>					
					<div class="Join-text">
						<label for="name"></label><spring:input path="name" class="Join4-2" />											<!--  -->
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">아이디</div>
					<div class="Join-text">
						<label for="id"></label>
						<spring:input path="id" class="Join4-3" placeholder="영문/숫자만 사용가능, 4~12자"/>
					</div>
					<span class="input-group-btn">
						<button
						class="btn-u btn-u-red btn_check" type="button"
						id="input_id">중복확인						
						</button>
					</span>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">비밀번호</div>
					<div class="Join-text">
						<label for="pw"></label>
						<spring:password path="pw" class="Join4-2" placeholder="영문/숫자만 사용가능, 4~12자"/>
						
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-2">비밀번호 확인</div>
					<div class="Join-text2">
						<label for="pw2"></label>
						<spring:password path="pw2" class="FJoin4-2-j" placeholder="영문/숫자만 사용가능, 4~12자"/>
					</div>
						<spring:errors path="pw2" cssStyle="font-size: 12px; color:red; text-align: center; margin-left: 210px;"></spring:errors>
				</div>
	
				<div class="Join4-1-b">
					<div class="Join4-1-1">이메일</div>
					<div class="Join-text">
						<label for="email"></label><spring:input path="email" class="Join4-4"/>
					</div>
					<span class="input-group-btn">
						<button
						class="btn-u btn-u-red" type="button"									
						id="pid_btn">중복확인						
						</button>
					</span>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">성별</div>
					<div class="Join-text">
						<spring:select path="gender" class="Join4-select" id="gender">
							<spring:option value="1">남성</spring:option>
							<spring:option value="2">여성</spring:option>
						</spring:select>
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">생년월일</div>
					<div class="Join-text">
						<input type="date" name="birth">						
					</div>				
				</div>	
				
				<div class="Join4-check">
						<label class="checkbox" style="font-size:11pt; color: gray;">
							<input type="checkbox" id="mailok" value="0" name="mailCheck">
							여행(계획)중일때에 해당 여행과 관련된 회원특가 광고메일을 받겠습니다.			
						</label>
				</div>	
				
				<a class="Join4or5-1" href="${pageContext.request.contextPath}/member/memberUsePage/memberPrivacyPolicy" target="_blank">이용약관</a>
				
				<a class="Join4or5-2" href="${pageContext.request.contextPath}/member/memberUsePage/memberTermsAndConditions" target="_blank">개인정보 취급방침</a>
				
				<div class="Join4-check2">
						<label class="checkbox" style="font-size:11pt; color: gray;">
							<input type="checkbox" id="agreeok" value="0">
							약관과 개인정보 수집 및 이용방침에 동의합니다.
						</label>
				</div>
					
			</div>			
		</spring:form>		
		
			<div class="Join5">
				<div class="Join5-btn1">회원가입</div>
				<div class="Join5-btn2"><a href="${pageContext.request.contextPath}/">취소</a></div>
			</div>
			
		</div>
	</div>
	
	
	
	
	
	
	
	
	<!-- ID 중복확인 DIV -------------------------------------------------------------------------------------------------------------------------->
	<!--오류사항 -->
	<div id="Xid" style="">
		<div id="idsame" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">아이디는 5자~10자까지<br> 가능합니다.</div>
			</div>
		</div>
	
		<div class="Xidsame3" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame2" style="background-color: #64db99; height: 40px; width: 40px; 
				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div>
		</div>
	</div>
	
	<!--정상사항 -->
<!-- 	<div id="Xid1" style=""> -->
<!-- 		<div id="idsame2" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;"> -->
<!-- 			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;"> -->
<!-- 				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">사용 가능한 아이디입니다.</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	
<!-- 		<div class="Xidsame7" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;">  -->
<!-- 			<div class="Xidsame6" style="background-color: #64db99; height: 40px; width: 40px;  -->
<!-- 				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	
	<!-- EMAIL 중복확인 DIV ------------------------------------------------------------------------------------------------------------------------>
	<!--오류사항 -->
	<div id="Xid2" style="">
		<div id="emailsame" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 280px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">잘못된 이메일 주소입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame5" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 80px;"> 
			<div class="Xidsame4" style="background-color: #64db99; height: 40px; width: 40px; 
				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>
	

	<!--정상사항 -->
<!-- 	<div id="Xid3" style=""> -->
<!-- 		<div id="emailsame2" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 280px;"> -->
<!-- 			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;"> -->
<!-- 				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">사용 가능한 이메일입니다.</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	
<!-- 		<div class="Xidsame9" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 80px;">  -->
<!-- 			<div class="Xidsame8" style="background-color: #64db99; height: 40px; width: 40px;  -->
<!-- 				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	
<script type="text/javascript">
//-----------------------------------------------------------------------	

//광고메일 동의
$("#mailok").click(function(){
    var check=$('#mailok').is(':checked');
    if(check){
		//true일경우 1넘겨주기
		$("#mailok").prop("value",1);
        }	
    else{
        //false	0넘겨주기
    	$("#mailok").prop("value",0);
        }
    });


//약관 및 개인정보 동의
$("#agreeok").click(function(){	
	check2 = $('#agreeok').is(':checked');
});

var check2=false;

$(".Join5-btn1").click(function(){
     if(check2 == false){
 		alert("약관과 개인정보 수집 및 이용방침에 동의 체크 확인 부탁드립니다.");
 		
 		
     }else{
    	 document.getElementById('frm2').submit(); 
         }
 });

//-----------------------------------------------------------------------	

//ID중복 확인    		택>>		1. 사용가능한 아이디입니다 .   2. 6~12자까지 가능합니다
$(function(){

			$('#Xid').hide();
  
$("#input_id").click(function(){

	$("#input_id").css("background","#95a5a6");

	$("#Xid").show();
	
	});
});


$(".Xidsame2").click(function(){

	$("#Xid").hide();
	
 	$("#input_id").css("background","#e74c3c");

});

//-----------------------------------------------------------------------

// $(function(){

// 			$('#Xid1').hide();
  
// $("#input_id").click(function(){

// 	$("#input_id").css("background","#95a5a6");

// 	$("#Xid1").show();
	
// 	});
// });


// $(".Xidsame6").click(function(){

// 	$("#Xid1").hide();

//	$("#input_id").css("background","#e74c3c");

// });

//-----------------------------------------------------------------------

//EMAIL중복 확인	 택>>		1. 잘못된 주소입니다.			2. 주소 확인 되었습니다.

$(function(){

			$('#Xid2').hide();
  
$("#pid_btn").click(function(){

	$("#pid_btn").css("background","#95a5a6");

	$("#Xid2").show();
	
	});
});


$(".Xidsame4").click(function(){

	$("#Xid2").hide();

	$("#pid_btn").css("background","#e74c3c");

});
//-----------------------------------------------------------------------

// $(function(){

// 			$('#Xid3').hide();

// $("#pid_btn").click(function(){

// 	$("#pid_btn").css("background","#95a5a6");

// 	$("#Xid3").show();
	
// 	});
// });


// $(".Xidsame8").click(function(){

// 	$("#Xid3").hide();

//	$("#pid_btn").css("background","#e74c3c");

// });


//-----------------------------------------------------------------------

//필수 규정 

//1. 아이디 : 6~12자
//2. pw : 4~12wk
//3. 이메일 : @포함(naver.com / daum.net / gmail.com)




</script>	
                                        
</body>
</html>