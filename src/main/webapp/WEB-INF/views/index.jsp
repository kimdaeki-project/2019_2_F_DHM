<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"/>
<link rel="stylesheet"  href="css/basic.css">
</head>
<body>
<div class="container" style="height: 100px;"></div>

<h1 style="text-align: center;">DHM 홈페이지</h1>

<div style="padding-left: 780px;">
	<a href="#"><img src="./imgs/5.png"></a>
</div>

<div class="container" style="height: 200px;"></div>

<div style="padding-left: 840px;">
	<c:if test= "${not empty member}"> 
	<a href="${pageContext.request.contextPath}/member/memberLogout"><button>로그아웃</button></a>
	</c:if>
	<c:if test= "${ empty member}"> 
	<a href="${pageContext.request.contextPath}/member/memberLogin"><button>로그인</button></a>
	<a href="${pageContext.request.contextPath}/member/memberJoin"><button>회원가입</button></a>	
	<a href="${pageContext.request.contextPath}/member/memberFacebookLogin"><button>페이스북 로그인</button></a>
	</c:if>
</div>
	
<div class="container" style="height: 100px;"></div>

	
<div style="padding-left: 800px;">
	<a href="http://211.238.142.38/planner/makePlanner"><button>성주형 감시</button></a>
	<a href="http://211.238.142.32"><button>재용이형 감시</button></a>
	<a href="http://211.238.142.33"><button>혜현이 감시</button></a>
	<a href="http://211.238.142.39"><button>병주형 감시</button></a>
	<a href="http://211.238.142.44"><button>팀 감시</button></a> <!-- 1team : 26 / 2team : 45 -->
</div>
	

	
<c:import url="./template/nav.jsp"/>
	<div class="container">
		<div class="jumbotron marginTop50px">
			<h3>스투비플래너로 상상속 유럽여행을 현실로 만들어 보세요.</h3>
			<p>855,014명의 유럽계획 데이터를 활용한 추천과 시뮬레이션 기능을 활용해 여행 아이디어를 실제 여행으로 만들어 예상 비용과 소요시간을 계산해 보세요.</p>
			<div class="main_planner_btn_div">
				<input type="button" class="main_planner_btn_diy" value="DIY">
				<input type="button" class="main_planner_btn_request" value="request">
			</div>
		</div>
	</div>
	<a href="notice/noticeList">noticeList</a><br>
	<a href="notice/noticeWrite">notice Write</a>
</body>
</html>