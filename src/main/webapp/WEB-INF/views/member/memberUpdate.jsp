<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
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

	<div class="updatemain"><!-- nav (테블릿)밀려나는 것 떄문에 margin-top임시로 둠 -->
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
					<spring:password path="pw" class="pwup" placeholder="특수/영문 대소문자/숫자만 사용가능, 6~12자" id="pwup"/>
				</div>
			</div>
		
			
			<div class="update4">
				<div class="update3-3">변경할 비밀번호 확인</div>
				<div class="update3-4">		
					<label for="pw2"></label>
					<spring:password path="pw2" class="pwup2" placeholder="특수/영문 대소문자/숫자만 사용가능, 6~12자"  id="pwup2"/>
					<spring:errors path="pw2" cssStyle="font-size: 12px; color:red; text-align: center; margin-left: 210px;"></spring:errors>
				</div>	
			</div>
			
			<div class="update5">
				<div class="update5-1">이메일</div>
				<label for="email">
				</label><spring:input  path="email" class="emailup" id="email10" placeholder="이메일 주소만 등록 가능."/>
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
				<div class="updatelast2"><a href="${pageContext.request.contextPath}/">취소</a></div>
			</div>
			
		</div>
			<img alt="" src="../imgs/member/st.png" class="imgst">
	</div>


</body>
<script type="text/javascript">
//-----------------------------------------------------------------------
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
	//등급 출력 변경
	$(function(){
		if(${member.gender} == 1){
			$(".update6-3").html('male');
			}else{
				if(${member.gender} == 2){
					$('.update6-3').html('female');
					}
				}
			});
//-----------------------------------------------------------------------
	//회원 탈퇴 페이지로 이동
	$(".updatemain2-1-2").click(function(){
		
	    location.href = "memberGetout";
	     	 
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
        	alert("광고 메일 수신 동의 하셨습니다.")
            }
	    });
//-----------------------------------------------------------------------
//저장
$(".updatelast1").click(function(){
	
	document.getElementById('memberUpdate').submit();
});

//-----------------------------------------------------------------------
</script>
</html>