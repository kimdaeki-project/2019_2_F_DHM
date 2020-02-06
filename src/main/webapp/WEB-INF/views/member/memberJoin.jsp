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
<link rel="stylesheet"  href="../css/membercss.css">
<link rel="stylesheet"  href="../css/basic.css">
 <link rel="stylesheet" href="../package/css/swiper.min.css">
<meta charset="UTF-8">
<title>member Join</title>
</head>
<body>

	<c:import url="../template/nav.jsp"/>

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
		<spring:form action="memberJoin" id="frm2" method="post" modelAttribute="memberVO" >	
			<div class="Join4">
				<div class="Join4-1-a">
					<div class="Join4-1-1">이름</div>					
					<div class="Join-text">
						<label for="name"></label><spring:input path="name" class="Join4-2" placeholder="한글 이름만 입력가능" id="name10"/>											
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">아이디</div>
					<div class="Join-text">
						<label for="id"></label>
						<spring:input path="id" class="Join4-3" placeholder="영문/숫자만 사용가능, 6~12자" id="id10"/>
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
						<spring:password path="pw" class="Join4-2" placeholder="특수/영문 대소문자/숫자만 사용가능, 6~12자" id="pw10"/>
						
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-2">비밀번호 확인</div>
					<div class="Join-text2">
						<label for="pw2"></label>
						<spring:password path="pw2" class="FJoin4-2-j" placeholder="특수/영문 대소문자/숫자만 사용가능, 6~12자"  id="pw11"/>
					</div>
						<spring:errors path="pw2" cssStyle="font-size: 12px; color:red; text-align: center; margin-left: 210px;"></spring:errors>
				</div>
	
				<div class="Join4-1-b">
					<div class="Join4-1-1">이메일</div>
					<div class="Join-text">
						<label for="email"></label><spring:input  path="email" class="Join4-4" id="email10" placeholder="이메일 주소만 등록 가능."/>		
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
	

	
	<!-- ID 중복확인 DIV --------------------------------------------------------------------------------------------------------------------------->
	<!--오류사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid" style="">
		<div id="idsame" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">아이디는 영문, 숫자 6자~12자까지 가능합니다.</div>
			</div>
		</div>
	
		<div class="Xidsame3" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame2" style="background-color: #64db99; height: 40px; width: 40px; 
 				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div>  
		</div>
	</div>
	
	<!--정상사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid1" style="">
		<div id="idsame2" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">사용 가능한 아이디입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame7" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame6" style="background-color: #64db99; height: 40px; width: 40px; 
  				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>

	<!--중복사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid4" style="">
		<div id="idsame3" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">아이디 중복입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame10" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame11" style="background-color: #64db99; height: 40px; width: 40px; 
  				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>

	<!-- EMAIL 중복확인 DIV ------------------------------------------------------------------------------------------------------------------------->
	<!--오류사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid2" style="">
		<div id="emailsame" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">잘못된 이메일 주소입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame5" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame4" style="background-color: #64db99; height: 40px; width: 40px; 
				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>
	
	<!--정상사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid3" style="">
		<div id="emailsame2" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">사용 가능한 이메일입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame9" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame8" style="background-color: #64db99; height: 40px; width: 40px; 
 				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>
	
	<!--중복사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid5" style="">
		<div id="emailsame3" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">이메일 중복입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame12" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame13" style="background-color: #64db99; height: 40px; width: 40px; 
  				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>
	
<script type="text/javascript">
//-----------------------------------------------------------------------	
//회원가입 제약조건 

//1. 아이디 : 6~12자   + 중복 메세지										ok!!!
//2. pw : 4~12자    												ok!!!
//3. 이메일 : @포함(naver.com / daum.net / gmail.com) + 중복 메세지		ok!!!
//4. 각종 특수문자 제외 : (1234567890/a-z/A-z 사용 가능)  					ok!!!


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

//-----------------------------------------------------------------------

//약관 및 개인정보 동의
$("#agreeok").click(function(){	
	check2 = $('#agreeok').is(':checked');
});
		
//아이디 이메일 중복 버튼을 눌러야 로그인이 가능하게끔 하기
$("#input_id").click(function(){	
	check3 = $('#input_id').is(':checked');
});

$("#pid_btn").click(function(){	
	check4 = $('#pid_btn').is(':checked');
});

//		+++++++

//약관 및 조합 변수 설정
var check2=false;
var check3=false;
var check4=false;
//이름 제약조건
var name = $("#name10").val();
var kor = name.match(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
//pw제약조건
var pw = $("#pw10").val();
var ENG = pw.match(/[A-Z]/g);
var num = pw.match(/[0-9]/g);
var eng = pw.match(/[a-z]/g);
var spe = pw.match(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/ig);

//이름, pw 약관 및 개인정보 동의
$(".Join5-btn1").click(function(){
	 name = $("#name10").val();
	 kor = name.match(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
	 
	 pw = $("#pw10").val();
	 ENG = pw.match(/[A-Z]/g);
	 num = pw.match(/[0-9]/g);
	 eng = pw.match(/[a-z]/g);
	 spe = pw.match(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/ig);

     if(check2 == false){
 		alert("[check] 약관과 개인정보 수집 및 이용방침에 동의 체크 확인 부탁드립니다.");	
			
	}else {
// 	    	 if(kor.length == null){
// 				alert("[name] 이름을 정확히 입력하십시오.");
	
// 	        	 }else 
		        	 if(kor==null){
					alert("[name] 한글을 포함한 이름을 다시 입력해주시기 바랍니다.");
					return false;
		        	 }
	        	 }//else if 문(kor==null)   	 
				
			 if(pw.length < 5 || pw.length > 13){		
				alert("[password] 영문, 숫자를 혼합한 6자리 ~ 12자리 이내로 입력해주세요.");				
				 
				}else if(num==null || eng ==null || ENG ==null || spe==null){ 									
					alert("[password] 한글을 제외한 특수문자, 영문 대소문자, 숫자를 혼합하여 입력해주세요."); 	
						
					}else { 

						if(check3 == false){
							alert("[oberlap] 아이디 중복 확인 해주시기 바랍니다.");
							}else{
								if(check4 == false){
									alert("[oberlap] 이메일 중복 확인 해주시기 바랍니다.");
								}else{
					    			document.getElementById('frm2').submit(); 									
						}//else문
					}	
	   		 }//if else문 (check2 == false)

						
}); //function문

//-----------------------------------------------------------------------	

//ID중복 확인    		택>>		1. 사용가능한 아이디입니다 .   2. 6~12자까지 가능합니다
//id제약조건
//id성공 메세지
var id = $("#id10").val();

	$("#Xid4").hide(); //중복 입력 상자 숨기
	$('#Xid1').hide(); //입력 성공 상자 숨기
	$('#Xid').hide();  //입력 오류 상자 숨기

$("#input_id").click(function(){

	 id = $("#id10").val();
	 num = id.match(/[0-9]/g);
	 eng = id.match(/[a-z]/g);

	 if(id.length < 5 || id.length > 13){	
		 $("#input_id").css("background","#95a5a6");	
		 $("#Xid").show();		
			 
			}else{
				if(num==null || eng ==null){ 									
				 $("#input_id").css("background","#95a5a6");	
				 $("#Xid").show();		
				}else{
						$.ajax({

							type : "POST",
							url  : "memberIdCheck",
							data : {
								id : id
								},
							success : function(d){

								if(d){
									
									 $("#input_id").css("background","#95a5a6");	
									 $("#Xid4").show();	
									 check3 = false;		

								}else {

									$("#input_id").css("background","#95a5a6");
									check3 = true;
									$("#Xid1").show();

								}	
							}//success문
						});	//ajax문
					} //if else문 (null)				
			} //if else문 (length)
	}); //function문

//입력 성공 상자 닫기 버튼	
$(".Xidsame6").click(function(){

	$("#Xid1").hide();
	
 	$("#input_id").css("background","#e74c3c");

});

//입력 오류 상자 닫기 버튼	
$(".Xidsame2").click(function(){

	$("#Xid").hide();

	$("#input_id").css("background","#e74c3c");

});

//중복입력 상자 닫기 버튼
$(".Xidsame11").click(function(){

	$("#Xid4").hide();

	$("#input_id").css("background","#e74c3c");

});
//-----------------------------------------------------------------------

//EMAIL중복 확인	 택>>		1. 잘못된 주소입니다.			2. 주소 확인 되었습니다.

var email = $("#email10").val();
var spe2 = email.match(/[@]/ig);
var spe3 = email.match(/[.]/ig);

	$("#Xid2").hide(); //중복 입력 상자 숨기
	$('#Xid3').hide(); //입력 성공 상자 숨기
	$('#Xid5').hide();  //입력 오류 상자 숨기

$("#pid_btn").click(function(){
	email = $("#email10").val();
	spe2 = email.match(/[@]/ig);
	spe3 = email.match(/[.]/ig);

	if(spe2 == null || spe3 == null){
		
		$("#pid_btn").css("background","#95a5a6");	
		$("#Xid2").show();
		
		}else{

		$.ajax({
		
			type : "POST",
			url  : "memberEMAILCheck",
			data : {
				email : email
				},
			success : function(c){
		
				if(c){
					
					 $("#pid_btn").css("background","#95a5a6");	
					 check4 = false;
					 $("#Xid5").show();			
		
				}else {
		 
					$("#pid_btn").css("background","#95a5a6");
					check4 = true;
					$("#Xid3").show();
		
				}	
			}//success문
		});	//ajax문
	}//spe2, spe3 제약 true 일때 시작문

});//function문


//입력 성공 상자 닫기 버튼	
$(".Xidsame4").click(function(){

	$("#Xid2").hide();
	
 	$("#pid_btn").css("background","#e74c3c");

});

//입력 오류 상자 닫기 버튼	
$(".Xidsame8").click(function(){

	$("#Xid3").hide();

	$("#pid_btn").css("background","#e74c3c");

});

//중복입력 상자 닫기 버튼
$(".Xidsame13").click(function(){

	$("#Xid5").hide();

	$("#pid_btn").css("background","#e74c3c");

});


		


</script>	
                                        
</body>
</html>