<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="./membercss.jsp"/>
<meta charset="UTF-8">
<title>member Login</title>
</head>
<body>
<h1>member Login</h1>
	
	<div class="mainbox">
		<div class="loginbox">
			<div class="Login1">
				<div class="Login1-1">페이스북계정으로 로그인</div>
			</div>
						
				<div class="Login2">
					<a href="#"><img class="login2img" src="../imgs/facebooklogin.png"></a>
				</div>
			
					<div class="Login3"></div>
			
					<div class="Login4">
						<div class="Login1-1">스투비계정으로 로그인</div>
					</div>
			
				<div class="Login5">
					<div class="login5-1">
						<div class="login5-1-1">아이디</div>
						<div class="login5-1-2">비밀번호</div>
					</div>

					<div class="login5-2">
						<div class="lgon5-3">
							<label for="pw"></label> <input type="text" class="login5-2-1 form-control" id="id" name="id">
						</div>
						
						<div class="lgon5-4">
							<label for="pw"></label> <input type="password" class=" login5-2-2 form-control" id="pw" name="pw">
						</div>
						
						<div class="login5-5">아이디/비밀번호 찾기</div>
					
					</div>


				</div>
			
			<div class="Login6">
			
			</div>
		</div>
	</div>
	
	<div class="container container1"></div>

<!-- <label for="pw" class="lgon5-text"></label> <input type="password" class="form-control" id="pw" name="pw"> -->


</body>
</html>