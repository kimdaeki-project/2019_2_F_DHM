<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<!-- boot.jsp jquery만 가져옴 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../css/membercss.css">
<link rel="stylesheet"  href="../css/basic.css">
 <link rel="stylesheet" href="../package/css/swiper.min.css">
<meta charset="UTF-8">
<title>member Login</title>
</head>
<body>

	<c:import url="../template/nav.jsp"/>
	
	<div class="container" style="height: 150px;"></div>
	
	<div class="mainbox">
		<div class="loginbox">
			<div class="Login1">
				<div class="Login1-1">GUEST 계정으로 입장</div>
			</div>
						
				<div class="Login2">
					<a href="${pageContext.request.contextPath}/planner/makePlanner"><img class="login2img" src="../imgs/logos/logo-green.png"></a>
					<div class="GuestJoin">☜ Guest Click</div>
				</div>
			
					<div class="Login3"></div>
			
					<div class="Login4">
						<div class="Login1-1">DHM 계정으로 로그인</div>
					</div>
			
				<div class="Login5">
					<div class="login5-1">
						<div class="login5-1-1">아이디</div>
						<div class="login5-1-2">비밀번호</div>
					</div>
				<form action="memberLogin" id="frm" method="post">
					<div class="login5-2">
						<div class="lgon5-3">
							<label for="id"></label><input type="text" class="login5-2-1 form-control" id="id" name="id" placeholder="Enter id" >
						</div>
						
						<div class="lgon5-4">
							<label for="pw"></label><input type="password" class=" login5-2-2 form-control" id="pw" name="pw" placeholder="Enter password">
						</div>
						
						<div ><a href="#" id="login5-5">아이디/비밀번호 찾기</a></div>
					
						<div class="col col-8">
							<label class="checkbox" style="font-size:9pt">
								<input type="checkbox" name="saveid" value="ON" checked>로그인 유지					
							</label>
						</div>
						<input type="hidden" name="goBack" value="${goBack }">
					</div>
				</form>	
				</div>
			
			<div class="Login6">
				<div class="btn1">로그인</div>
				<div class="btn2"><a href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a></div>
			</div>
		</div>
	</div>
	
	<div class="Login7">
		<a href="#"><img class="Login7img" src="../imgs/funhan.png"></a>
	</div>

	<div style="height: 30px;"></div>
	
	
	
		<c:import url="../template/footer.jsp"/>
	
<script type="text/javascript">

	$(".btn1").click(function() {
        document.getElementById('frm').submit();        
        return false;
	});

	//아이디 비밀번호 입력시 enter를 눌렀을 경우 넘어가게 설정 (enter 코드 = 13)
	$("#pw").keyup(function(e){
	 if(e.keyCode == 13){
		 $(".btn1").click();
	    }
	 });

</script>
</body>
</html>