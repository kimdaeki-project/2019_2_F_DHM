<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/imgs/logos/logo-fav.ico">
<!-- boot.jsp jquery만 가져옴 -->
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
				<div class="idpwmain4-2">
					<div class="idpwmain4-2-1">
						<div class="idpwmain4-2-2">이메일 주소 : </div>
					</div>
				</div>
			
			<!-- 이메일1 입력창 -->
				<div class="idpwmain4-3">
					<input type="text" class="idpwmain4-3-1">
					<div class="idpwmain4-3-2">찾기</div>
				</div>
			<!-- 이메일1 입력창 -->	
			</div>
			
			
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
					<input type="text" class="idpwmain5-3-1">
				</div>
			<!-- 아이디1 입력창 -->	
				<div class="idpwmain5-2">
					<div class="idpwmain5-2-1">
						<div class="idpwmain5-2-2">이메일 주소 : </div>
					</div>
				</div>			
			<!-- 이메일2 입력창 -->	
				<div class="idpwmain5-3">
					<input type="text" class="idpwmain5-3-1">
					<div class="idpwmain5-3-2">재발급</div>
				</div>
			<!-- 이메일2 입력창 -->	
				
				
				
				
				
				
			
			
			</div>
			
		</div>
	</div>





	
	
	
	
	
	
	<c:import url="../../template/footer.jsp"/>
</body>
</html>