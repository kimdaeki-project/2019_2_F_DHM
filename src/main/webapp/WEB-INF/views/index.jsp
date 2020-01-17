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