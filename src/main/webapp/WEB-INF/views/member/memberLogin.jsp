<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<!-- boot.jsp jquery만 가져옴 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="./membercss.jsp"/>
<meta charset="UTF-8">
<title>member Login</title>
</head>
<body>

	<div class="header">
		<c:if test= "${not empty member}"> 
			<a href="${pageContext.request.contextPath}/member/memberJoin"><button>Member Join</button></a>
			<a href="${pageContext.request.contextPath}/member/memberLogin"><button>Member Login</button></a>
			<a href="${pageContext.request.contextPath}/member/memberFacebookLogin"><button>Member FacebookJoin</button></a>
			<button>Logout</button>
		</c:if>
	</div>

	<div class="container container1"></div>
	
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
	
	
	<div class="footer"></div>
	
<script type="text/javascript">

	$(".btn1").click(function() {
        document.getElementById('frm').submit();
        
        return false;
});


</script>
</body>
</html>