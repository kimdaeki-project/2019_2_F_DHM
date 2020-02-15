<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- 버튼 bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../css/membercss.css">
<link rel="stylesheet"  href="../css/basic.css">
<link rel="stylesheet" href="../package/css/swiper.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:import url="../template/nav.jsp"/>

	<div class="container" style="height: 60px;"></div>

	<div class="updatemain" ><!-- nav (테블릿)밀려나는 것 떄문에 margin-top임시로 둠 -->
		<div class="updatemain2">
			<div class="updatemain2-1">
				<div class="updatemain2-1-1"><h2>회원정보 변경</h2></div>
				<div class="updatemain2-1-2">회원 탈퇴</div>
			</div>
			<!--spring:form tag 사용 해야함 -->
			<div class="updatemain3-1">
				<div class="updatemain3-1-img">
				<c:choose>
					<c:when test="${member.memberFilesVO.fname eq null}">
						<a><img id="img" src="../imgs/dog.jpg" class="mypage1-1-1-1" style="width: 80px; height: 80px;"></a>					
					</c:when>								
					<c:otherwise>
						<img id="img" style="width: 80px; height: 80px;" src="../imgs/member/${member.memberFilesVO.fname}">
					</c:otherwise>			
				</c:choose>
				</div>	
			<spring:form action="memberUpdateImg" id="memberUpdateImg" method="post" modelAttribute="memberVO" enctype="multipart/form-data">	
				<input class="updatemain3-2-img" type="file" id="input_img"name="files">
			</spring:form>			
			</div>
			
			<spring:form action="memberUpdate" id="memberUpdate" method="post" modelAttribute="memberVO" >						
			<div class="update1">
				<div class="update1-1"> 이름</div>
				<div class="update1-2">
					<div class="nameup">${member.name}</div>
					<input type="hidden" value="${member.name}" name="name">
				</div>
			</div>
			
			<div class="update2">
				<div class="update2-1">아이디</div>
				<div class="update2-2">
					<div class="idup">${member.id}</div>
					<input type="hidden" value="${member.id}" name="id">
				</div>
			</div>
			
			<div class="update3">
				<div class="update3-1">변경할 비밀번호</div>
				<div class="update3-2">
					<label for="pw"></label>
					<spring:password path="pw" class="pwup" placeholder="특수/영문 대소문자/숫자만 사용가능, 6~12자" id="pw10"/>
				</div>
				<input type="button" id="ppw_btn" class="btn-u btn-u-red" value="중복확인"
				style="margin-left: 20px; margin-top: 19px; width: 80px; height: 35px;">
			</div>
	
			
			<div class="update4">
				<div class="update3-3">변경할 비밀번호 확인</div>
				<div class="update3-4">		
					<label for="pw2"></label>
					<spring:password path="pw2" class="pwup2" placeholder="특수/영문 대소문자/숫자만 사용가능, 6~12자"  id="pw11"/>
				</div>	
			</div>
			
			<div class="update5">	
				<div class="update5-1">이메일</div>
				<label for="email">
				</label><spring:input  path="email" class="emailup" id="email10" placeholder="이메일 주소만 등록 가능."/>
				<input type="button" id="pemail_btn" class="btn-u btn-u-red" value="중복확인"
				style="margin-left:-5px; margin-top: 15px; width: 80px; height: 35px;">
			</div>
			
			<div class="update6">
				<div class="update6-1">성별</div>
				<div class="update6-2"><p class="update6-3">${member.gender}</p></div>
				<input type="hidden" value="${member.gender}" name="gender">
			</div>
			
			<div class="update7">
				<div class="update7-1">생년월일</div>
				<div class="update7-2"><p class="update7-3">
				<fmt:formatDate value="${member.birth}" pattern="yyyy" var="birthY"/>
				<fmt:formatDate value="${member.birth}" pattern="MM" var="birthM"/>
				<fmt:formatDate value="${member.birth}" pattern="dd" var="birthD"/>
				${birthY}년 ${birthM}월 ${birthD}일 
				</p></div>
				<input type="hidden" value="${member.birth}" name="birth">
			</div>
			
			<div class="update8-1">
				<label class="checkbox" style="font-size:11pt; color: gray;">
					<input type="checkbox" id="mailok1" value="0" name="mailCheck">
					<b>여행(계획)중일때에 해당 여행과 관련된 회원특가 광고메일을 받겠습니다.</b>	
					
					<input type="hidden" value="${member.grade}" name="grade">
					<input type="hidden" value="${member.mymsg}" name="mymsg">		
					<input type="hidden" value="${member.introduce}" name="introduce">
					<input type="hidden" value="${member.live}" name="live">
					<input type="hidden" value="${member.language}" name="language">
					<input type="hidden" value="${member.tour}" name="tour">
					<input type="hidden" value="${member.tema}" name="tema">
					<input type="hidden" value="${member.helpcity}" name="helpcity">
					<input type="hidden" value="${member.social}" name="social">

				</label>
			</div>			
			</spring:form>		
			
			<div class="updatelast">
				<div class="updatelast1">저장</div>
				<div class="updatelast2">취소</div>
			</div>
			
		</div>
			<div class="imgst" style="height: 20px;"></div>
<!-- 			<img alt="" src="../imgs/member/st.png" class="imgst"> -->
	</div>


</body>

	<!-- PW 중복확인 DIV --------------------------------------------------------------------------------------------------------------------------->
	<!--오류사항 ------------------------------------------------------------------------------------------------------------------------------------>
	<div id="Xid" style="">
		<div id="idsame" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 12pt; width: 190px; padding-left: 15px; padding-top: 10px; line-height: 17px;">특수/영문 대소문자/숫자만 사용가능, 6~12자 사용가능합니다.</div>
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
				<div style="color: white; font-size: 13pt; width: 190px; padding-left: 15px; padding-top: 10px;">사용 가능한 비밀번호입니다.</div>
			</div>
		</div>
	
		<div class="Xidsame7" style= " position: fixed; background-color: #fff; top: 110px; left: 1050px; height: 50px; width: 50px;"> 
			<div class="Xidsame6" style="background-color: #64db99; height: 40px; width: 40px; 
   				margin-left: 5px; margin-top: 5px;"><i class="fa fa-times" style="color: #fff; font-size: 30px; padding-left: 7px; padding-top: 4px;"></i></div> 
		</div>
	</div>

	<!--중복사항 ---------------------------------------------------------------------------------------------------------------------------------- -->
	<div id="Xid4" style="">
		<div id="idsame3" style="position: fixed; top: 125px; left:830px; background-color: #fff; height: 80px; width: 250px;">
			<div style="background-color: #64db99; height: 70px; width: 240px; margin-left: 5px; margin-top: 5px;">
				<div style="color: white; font-size: 12pt; width: 190px; padding-left: 15px; padding-top: 10px;">기존 비밀번호 입력하셨습니다. 재입력하십시오.</div>
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
	<input type="text" value="${member.pw}" id="getPW" style="display: none;">
	
			<c:import url="../template/footer.jsp"/>
<script type="text/javascript">
//-----------------------------------------------------------------------------
	$("#Xid2").hide(); //오류 입력 상자 숨기
	$('#Xid3').hide(); //정확 성공 상자 숨기
	$('#Xid5').hide();  //중복 오류 상자 숨기
//+++++++++++++++++++++++++++++++++++++++++++++++++
	//입력 성공 상자 닫기 버튼	
	$(".Xidsame4").click(function(){
		$("#Xid2").hide();	
	 	$("#pemail_btn").css("background","#e74c3c");
	});

	//입력 오류 상자 닫기 버튼	
	$(".Xidsame8").click(function(){
		$("#Xid3").hide();
		$("#pemail_btn").css("background","#e74c3c");
	});

	//중복입력 상자 닫기 버튼
	$(".Xidsame13").click(function(){
		$("#Xid5").hide();
		$("#pemail_btn").css("background","#e74c3c");
	});
//+++++++++++++++++++++++++++++++++++++++++++++++++
	
	var email = $("#email10").val();
	var spe2 = email.match(/[@]/ig);
	var spe3 = email.match(/[.]/ig);

	$("#pemail_btn").click(function(){
		email = $("#email10").val();
		spe2 = email.match(/[@]/ig);
		spe3 = email.match(/[.]/ig);

		if(spe2 == null || spe3 == null){
			
			$("#pemail_btn").css("background","#95a5a6");	
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
						
						 $("#pemail_btn").css("background","#95a5a6");	
						 check4 = false;
						 $("#Xid5").show();			
			
					}else {
			 
						$("#pemail_btn").css("background","#95a5a6");
						check4 = true;
						$("#Xid3").show();
			
					}	
				}//success문
			});	//ajax문
		}//spe2, spe3 제약 true 일때 시작문

	});//function문

//+++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//ppw_btn   pw10

	$("#Xid4").hide(); //중복 입력 상자 숨기
	$('#Xid1').hide(); //입력 성공 상자 숨기
	$('#Xid').hide();  //입력 오류 상자 숨기
//+++++++++++++++++++++++++++++++++++++++++++++++++
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
	
	//중복입력 상자 닫기 버튼
	$(".Xidsame11").click(function(){	
		$("#Xid4").hide();	
		$("#ppw_btn").css("background","#e74c3c");	
	});
//+++++++++++++++++++++++++++++++++++++++++++++++++
	var pw = $("#pw10").val();
	var ENG = pw.match(/[A-Z]/g);
	var num = pw.match(/[0-9]/g);
	var eng = pw.match(/[a-z]/g);
	var spe = pw.match(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/ig);

	$("#ppw_btn").click(function(){

		 pw = $("#pw10").val();
		 ENG = pw.match(/[A-Z]/g);
		 num = pw.match(/[0-9]/g);
		 eng = pw.match(/[a-z]/g);
		 spe = pw.match(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/ig);

		 if(pw.length < 5 || pw.length > 13){	
			 $("#ppw_btn").css("background","#95a5a6");	
			 $("#Xid").show();		
				 
			}else{
					if(num==null || eng ==null || ENG ==null || spe==null){ 									
					 $("#ppw_btn").css("background","#95a5a6");	
					 $("#Xid").show();		
					}else{
						var pass=$('#getPW').val();
							if(pw == pass){
								
								 $("#ppw_btn").css("background","#95a5a6");	
								 $("#Xid4").show();	
								 check3 = false;		

							}else {

								$("#ppw_btn").css("background","#95a5a6");
								check3 = true;
								$("#Xid1").show();

							}	

					}	
			}
	}); //function문

//-----------------------------------------------------------------------------
	var check3=false;
	var check4=false;
	var pw = $("#pw10").val();
	var pw2 = $("#pw11").val();
		
	$(".updatelast1").click(function(){	
		
		pw = $("#pw10").val();
		pw2 = $("#pw11").val();

			if(check3 == false){
				alert("[oberlap] 비밀번호 중복 확인 해주시기 바랍니다.");
				}else{
					if(check4 == false){
						alert("[oberlap] 이메일 중복 확인 해주시기 바랍니다.");
					}else{
						if(pw != pw2){
							alert("[password] 비밀번호가 일치하지 않습니다.");
							}else{
		    			document.getElementById('memberUpdate').submit(); 									
						}//else 마지막문
				}//else2번째문
				
			}//else1번째문
							
}); //function문

//-----------------------------------------------------------------------------
	//프로필 사진 변경 BOX 사진 미리보기
	var sel_file;
	
	$(document).ready(function(){
		$("#input_img").on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
				}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src", e.target.result);
				$("#img").attr("class", "");
				}
			reader.readAsDataURL(f);
			
			});
		}
//-----------------------------------------------------------------------
	//성별 출력 변경
	$(function(){
		if(${member.gender} == 1){
			$(".update6-3").html('남성');
			}else{
				if(${member.gender} == 2){
					$('.update6-3').html('여성');
					}
				}
			});
//-----------------------------------------------------------------------
	//회원 탈퇴 페이지로 이동
	$(".updatemain2-1-2").click(function(){
		
	    location.href = "memberGetout";
	     	 
		});

	//회원 정보 변경 취소-> 마이페이지로 이동
	$(".updatelast2").click(function(){
	
    	location.href = "memberMypage";
     	 
		});
//-----------------------------------------------------------------------
	//광고 메일 재동의 체크박스
	$("#mailok1").click(function(){
	    var check=$('#mailok1').is(':checked');
    		var checknum = 0;
    		
	    if(check){
			//true일경우 1넘겨주기
			$("#mailok1").prop("value",1);
			checknum = 1;
	        }	
	    else{
	        //false	0넘겨주기
	    	$("#mailok1").prop("value",0);
	    	checknum = 0;
	        }
        if(checknum == 1){
        	alert("광고 메일 수신 동의 하셨습니다.");
            }
	    });
//-----------------------------------------------------------------------
</script>
</html>