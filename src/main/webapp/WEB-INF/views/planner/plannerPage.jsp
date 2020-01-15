<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="../css/planner.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91fb61305af50f444a07659b68d73d1f"></script>
<c:import url="../template/boot.jsp"/>
</head>
<body>
	<div style="background-color: #f5f5f5">
	<div class="header">
	</div>
	<div class="container">
		<div class="main-container">
			
			<div >
				<h3 class="planner-title">여행제목</h3>
			</div>
			<div class="main-contents">
				<div class="map-wrapper">
					<div class="map" id="map">
						지도올자리
						<div class="map-peopleType">
							<div class="map-header">
								<img id="peopleTypeimg" src="//www.stubbyplanner.com/img_v14/tripwith/TW_2_2.png">
							</div>
							<div class="map-body">남자끼리</div>
							
						</div>
						<div class="map-rootModify">
							<div class="map-header">
								<i class="fa fa-cog fa-2x" style="color: #747474; margin-top: 9px;margin-bottom: 7px;"></i>
							</div>
							<div class="map-body">루트수정</div>
							
						</div>
						<div class="map-startDate">
							<div class="map-header">
							<i class="fa fa-cog" aria-hidden="true" style="color: #747474; margin-top: 9px;margin-bottom: 7px;"><div style="font-size: 12px; font-weight: 700; float: right; margin-left: 2px; line-height: 1.2;">2020년1월14일 출발</div></i>
							</div>
							<div class="map-body"></div>
							
						</div>
						<div class="map-date">
							<div class="map-header"></div>
							<div class="map-body">3일간</div>
							
						</div>
					</div>
				</div>
				<div class="calendar-wrapper">
					<div class="calendar">
						<h3 style="text-align: center;">2020년 1월</h3>
						<table class="cal-table">
							<thead>
								<tr class="t-head">
									<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
								</tr>
							</thead>
							<tbody>
								<tr class="t-body">
									<td>
										<div class="t-bhead">1</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">2</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">3</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">4</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">5</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">6</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">7</div>
										<div class="t-bbody"></div>
									</td>
								</tr>
								<tr class="t-body">
									<td>
										<div class="t-bhead">1</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">2</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">3</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">4</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">5</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">6</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">7</div>
										<div class="t-bbody"></div>
									</td>
								</tr>
								<tr class="t-body">
									<td>
										<div class="t-bhead">1</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">2</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">3</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">4</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">5</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">6</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">7</div>
										<div class="t-bbody"></div>
									</td>
								</tr>
								<tr class="t-body">
									<td>
										<div class="t-bhead">1</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">2</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">3</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">4</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">5</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">6</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">7</div>
										<div class="t-bbody"></div>
									</td>
								</tr>
								<tr class="t-body">
									<td>
										<div class="t-bhead">1</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">2</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">3</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">4</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">5</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">6</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">7</div>
										<div class="t-bbody"></div>
									</td>
								</tr>
								<tr class="t-body">
									<td>
										<div class="t-bhead">1</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">2</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">3</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">4</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">5</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">6</div>
										<div class="t-bbody"></div>
									</td>
									<td>
										<div class="t-bhead">7</div>
										<div class="t-bbody"></div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="middle-contents">
				<div class="middle-title">
					<h3 style="color: black;">간략한 일정</h3>
				</div>
				<div class="middle-wrapper">
					<div class="row" style="margin-top: 20px;">
						<ul class="nolist">
							<li class="">
								<div class="nolist-dot"></div>
								<div class="nolist-line"></div>
								<div class="nolist-region">부산</div>
								<div class="nolist-transfer" onclick="transfer();">
									<img src="../image/train.jpg">
								</div>
								<div class="notlist-ballon"></div>
								<div class="notlist-ballon2"> </div>
							</li>
							<li class="">
								<div class="nolist-dot"></div>
								<div class="nolist-line"></div>
								<div class="nolist-line2"></div>
								<div class="nolist-region">대구</div>
								<div class="nolist-transfer">
									
								
								</div>
							</li>
						</ul>
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</div>
	<script type="text/javascript">
		function transfer(){
			alert('dd');
		}

		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	</script>
</body>
</html>