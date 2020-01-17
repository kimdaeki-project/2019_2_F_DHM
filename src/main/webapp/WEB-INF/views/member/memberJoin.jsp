<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<!-- boot.jsp jquery만 가져옴 -->
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
						<button onclick="javascript:check('');"
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
						<spring:errors path="pw"></spring:errors>
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
						<button onclick="javascript:check('');"
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
							<input type="checkbox" id="agreeok" value="0" >
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
<script type="text/javascript">

$(".Join5-btn1").click(function() {
    document.getElementById('frm2').submit(); 
    return false;
});

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

$("#agreeok").click(function(){
	
});






</script>	
                                        
</body>
</html>