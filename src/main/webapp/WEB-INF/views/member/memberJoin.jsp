<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
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
			
			<div class="Join4">
				<div class="Join4-1-a">
					<div class="Join4-1-1">이름</div>					
					<div class="Join-text">
						<label for="name"></label><input type="text" class="Join4-2" id="name" name="name">
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">아이디</div>
					<div class="Join-text">
						<label for="id"></label><input type="text" class="Join4-3" id="id" name="id" placeholder="영문/숫자만 사용가능, 4~12자">
					</div>
					<span class="input-group-btn">
						<button onclick="javascript:check('');"
						class="btn-u btn-u-red" type="button"
						id="pid_btn">중복확인						
						</button>
					</span>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">비밀번호</div>
					<div class="Join-text">
						<label for="pw"></label><input type="password" class="Join4-2" id="pw" name="pw" placeholder="영문/숫자만 사용가능, 4~8자">
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">비밀번호 확인</div>
					<div class="Join-text">
						<label for="pw2"></label><input type="password" class="Join4-2" id="pw2" name="pw2">
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">이메일</div>
					<div class="Join-text">
						<label for="email"></label><input type="text" class="Join4-4" id="email" name="email">
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
						<select id="gender" name="gender" class="Join4-select">
						<option value="M">남성</option>
						<option value="W">여성</option>
						</select>
					</div>
				</div>
				
				<div class="Join4-1-b">
					<div class="Join4-1-1">생년월일</div>
					<div class="Join-text">
						<select id="birth" name="birth" class="Join4-birth1">						
								<c:forEach var="y" begin="1920" end="2020">
									<option><c:out value="${y}"/></option>
								</c:forEach>					
						</select>	
						
						<select id="birth2" name="birth2" class="Join4-birth2">								
								<c:forEach var="d" begin="1" end="31">
									<option><c:out value="${d}"/></option>
								</c:forEach>	
						</select>			
					</div>				
				</div>	
				
				<div class="Join4-check">
						<label class="checkbox" style="font-size:11pt; color: gray;">
							<input type="checkbox" name="saveid" value="ON" checked>
							여행(계획)중일때에 해당 여행과 관련된 회원특가 광고메일을 받겠습니다.			
						</label>
				</div>
				
				<a class="Join4or5-1" href="${pageContext.request.contextPath}/member/memberUsePage/memberPrivacyPolicy">이용약관</a>
				
				<a class="Join4or5-2" href="${pageContext.request.contextPath}/member/memberUsePage/memberTermsAndConditions">개인정보 취급방침</a>
				
				<div class="Join4-check2">
						<label class="checkbox" style="font-size:11pt; color: gray;">
							<input type="checkbox" name="saveid" value="ON" checked>
							약관과 개인정보 수집 및 이용방침에 동의합니다.		
						</label>
				</div>
				
					
			</div>			
			
			<div class="Join5">
				<div class="Join5-btn1">회원가입</div>
				<div class="Join5-btn2"><a href="${pageContext.request.contextPath}/">취소</a></div>
			</div>
			
		</div>
	</div>
	
                                        
</body>
</html>