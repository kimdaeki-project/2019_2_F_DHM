<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="./member/membercss.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
</head>
<body>

<!-- <div class="container" style="height: 100px;"></div> -->

<!-- <h1 style="text-align: center;">DHM 홈페이지</h1> -->

<!-- <div style="padding-left: 780px;"> -->
<!-- 	<a href="#"><img src="./imgs/5.png"></a> -->
<!-- </div> -->

<!-- <div class="container" style="height: 200px;"></div> -->

<!-- <div style="padding-left: 840px;"> -->
	
<!-- 	<a href=""><button>로그아웃</button></a> -->
<!-- 	<a href=""><button>마이 페이지</button></a> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test= "${ empty member}">  --%>
<!-- 	<a href=""><button>로그인</button></a> -->
<!-- 	<button>회원가입</button></a>	 -->
<%-- 	<a href="${pageContext.request.contextPath}/member/memberFacebookLogin"><button>페이스북 로그인</button></a> --%>
<%-- 	</c:if> --%>
<!-- </div> -->
	
<!-- <div class="container" style="height: 100px;"></div> -->

	
<!-- <div style="padding-left: 800px;"> -->
<!-- 	<a href="http://211.238.142.38/planner/makePlanner"><button>성주형 감시</button></a> -->
<!-- 	<a href="http://211.238.142.32"><button>재용이형 감시</button></a> -->
<!-- 	<a href="http://211.238.142.33"><button>혜현이 감시</button></a> -->
<!-- 	<a href="http://211.238.142.39"><button>병주형 감시</button></a> -->
<!-- 	<a href="http://211.238.142.44"><button>팀 감시</button></a> 1team : 26 / 2team : 45 -->
<!-- </div> -->

	
<c:import url="./template/nav.jsp"/>
	<div class="container" style=" padding-bottom: 200px;">
		<div class="jumbotron marginTop50px">
			<h3>스투비플래너로 상상속 유럽여행을 현실로 만들어 보세요.</h3>
			<p>855,014명의 유럽계획 데이터를 활용한 추천과 시뮬레이션 기능을 활용해 여행 아이디어를 실제 여행으로 만들어 예상 비용과 소요시간을 계산해 보세요.</p>
			<div class="main_planner_btn_div">
				<input type="button" class="main_planner_btn_diy" value="DIY">
				<input type="button" class="main_planner_btn_request" value="request">
			</div>
		</div>
		<div class="marginTop50px">
			<h3>다른 여행자들의 플래너 855,014개</h3>
			<div class="index_buttons">
				<ul class="index_buttons_ul">
					<li class="index_buttons_li index_buttons_li_active">최신</li>
					<li class="index_buttons_li">최신</li>
					<li class="index_buttons_li">아이들과</li>
					<li class="index_buttons_li">커플/신혼</li>
					<li class="index_buttons_li">부모님과</li>
					<li class="index_buttons_li">남자혼자</li>
					<li class="index_buttons_li">여자혼자</li>
					<li class="index_buttons_li">여자끼리</li>
					<li class="index_buttons_li">남자끼리</li>
					<li class="index_buttons_li">남녀그룹</li>
					<!-- 밑에는 지우는거 -->
					<li class="index_buttons_li">남자혼자</li>
					<li class="index_buttons_li">여자혼자</li>
					<li class="index_buttons_li">여자끼리</li>
					<li class="index_buttons_li">남자끼리</li>
					<li class="index_buttons_li">남녀그룹</li>
				</ul>
			</div>
			<div class="index_samplePlanner">
				<div class="samplePlannerCard">
					<div class="samplePlannerCard_map">map</div>
					<div class="samplePlannerCard_info">map info</div>
				</div>
				<div class="samplePlannerCard">
					<div class="samplePlannerCard_map">map</div>
					<div class="samplePlannerCard_info">map info</div>
				</div>
				<div class="samplePlannerCard">
					<div class="samplePlannerCard_map">map</div>
					<div class="samplePlannerCard_info">map info</div>
				</div>
				<div class="samplePlannerCard">
					<div class="samplePlannerCard_map">map</div>
					<div class="samplePlannerCard_info">map info</div>
				</div>
			</div>
		</div>
		<div class="marginTop50px">
			<h3>유럽 현지투어 얼리버드 & 결합 SALE</h3>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
			<div class="indexImgCard">
				<div class="indexImgCard_img">
					<div class="indexImgCard_img_title">title</div>
					<div class="indexImgCard_img_text">text text text text text text text</div>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 100px;">ㄴㅁㅇㄹㅇㅁㄹㄹㄴㅇㅇㄹㄴㅁㅁㄹㅇㄴ</div>
</body>
</html>