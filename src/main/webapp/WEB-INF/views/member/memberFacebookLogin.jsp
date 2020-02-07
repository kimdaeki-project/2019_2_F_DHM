<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="../css/membercss.css">
<meta charset="UTF-8">
<title>member FacebookJoin</title>
</head>
<body>

	<div class="container" style="height:70px;"></div>
	
	<div class="FJoinmain">
		<div class="FJoinMainPage">
			<div class="FJoin1">
				<div class="FJoin1-1">회원가입 with FACEBOOK</div>
			</div>
			
			<div class="FJoin2">
				<div class="FJoin2-1">My Facebook Account</div>
				<div class="FJoin2-2"><img class="FJoin2-2-img" alt="" src=""></div>
				<div class=FJoin2-3>전영재</div>
			</div>
		
			
			<div class="FJoin4">
				<div class="FJoin4-1-a">
					<div class="FJoin4-1-1">이름</div>					
					<div class="FJoin-text">
						<label for="name"></label><input type="text" class="FJoin4-2" id="name" name="name">
					</div>
				</div>
				
				<div class="Foin4-1-b">
					<div class="FJoin4-1-1">이메일</div>
					<div class="FJoin-text">
						<label for="email"></label><input type="text" class="FJoin4-4" id="email" name="email">
					</div>
					<span class="Finput-group-btn">
						<button onclick="javascript:check('');"
						class="Fbtn-u Fbtn-u-red" type="button"
						id="Fpid_btn">중복확인						
						</button>
					</span>
				</div>
				
				<div class="FJoin4-1-b">
					<div class="FJoin4-1-1">아이디</div>
					<div class="FJoin-text">
						<label for="id"></label><input type="text" class="FJoin4-3" id="id" name="id" placeholder="영문/숫자만 사용가능, 4~12자">
					</div>
					<span class="Finput-group-btn">
						<button onclick="javascript:check('');"
						class="Fbtn-u Fbtn-u-red" type="button"
						id="Fpid_btn">중복확인						
						</button>
					</span>
				</div>
				
				<div class="FJoin4-1-b">
					<div class="FJoin4-1-1">비밀번호</div>
					<div class="FJoin-text">
						<label for="pw"></label><input type="password" class="FJoin4-2" id="pw" name="pw" placeholder="영문/숫자만 사용가능, 4~8자">
					</div>
				</div>
				
				<div class="FJoin4-1-b">
					<div class="FJoin4-1-1">비밀번호 확인</div>
					<div class="FJoin-text">
						<label for="pw2"></label><input type="password" class="FJoin4-2" id="pw2" name="pw2">
					</div>
				</div>
				
				
				<div class="FJoin4-1-b">
					<div class="FJoin4-1-1">성별</div>
					<div class="FJoin-text">
						<select id="gender" name="gender" class="FJoin4-select">
						<option value="M">남성</option>
						<option value="W">여성</option>
						</select>
					</div>
				</div>
				
				<div class="FJoin4-1-b">
					<div class="FJoin4-1-1">생년월일</div>
					<div class="FJoin-text">
						<select id="birth" name="birth" class="FJoin4-birth1">						
								<c:forEach var="y" begin="1920" end="2020">
									<option><c:out value="${y}"/></option>
								</c:forEach>					
						</select>	
						
						<select id="birth2" name="birth2" class="FJoin4-birth2">								
								<c:forEach var="d" begin="1" end="31">
									<option><c:out value="${d}"/></option>
								</c:forEach>	
						</select>			
					</div>				
				</div>	

				
				<div class="FJoin4-check2">
						<label class="Fcheckbox" style="font-size:11pt; color: gray;">
							<input type="checkbox" name="saveid" value="ON" checked>
							이용약관 및 개인정보처리 방침에 동의합니다.	
						</label>
				</div>
				
					
			</div>			
			
			<div class="FJoin5">
				<div class="FJoin5-btn1">회원가입</div>
				<div class="FJoin5-btn2"><a href="${pageContext.request.contextPath}/">취소</a></div>
			</div>
			
		</div>
	</div>


</body>
</html>