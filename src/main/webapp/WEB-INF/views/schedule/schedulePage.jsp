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
<link rel="stylesheet"  href="../css/schedule.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91fb61305af50f444a07659b68d73d1f"></script>

<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

<c:import url="../template/boot.jsp"/>

</head>
<body>
	<div style="background-color: #f5f5f5">
	<div class="header">
	</div>
	<div class="container">
		<div class="main-container">
			
			<div >
				<h3 class="contents-title">${planner["0"].title}</h3>
				
			</div>
			<div class="main-contents">
				<div class="map-wrapper">
					<div class="map" id="map">
						지도올자리
						<div class="map-peopleType">
							<div class="swiper-before">
								<div class="map-header">
									<img id="peopleTypeimg" src="//www.stubbyplanner.com/img_v14/tripwith/TW_2_2.png">
								</div>
								<div class="map-body">남자끼리</div>
							</div>
							<div class="swiper-modal swiper">
								<div class="modal-head" style="text-align: center; padding-top: 20px;">
									<font style="color: white; font-size: 13pt; font-weight: 700;">누구와 함께하는 여행인가요?</font>
								</div>
								<div style="padding-bottom: 15px;">
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_1_1_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">여자혼자</font>
										</div>
									</div>
									
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_1_2_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">남자혼자</font>
										</div>
									</div>
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_1_3_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">커플/신혼</font>
										</div>
									</div>
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_2_1_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">여자끼리</font>
										</div>
									</div>
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_2_2_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">남자끼리</font>
										</div>
									</div>
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_2_3_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">남녀함께</font>
										</div>
									</div>
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_3_1_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">아이들과</font>
										</div>
									</div>
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_3_2_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">부모님과</font>
										</div>
									</div>
									
									<div style="float: left; width: 33%;">
										<a>
											<img src="https://www.stubbyplanner.com/img_v14/tripwith/TW_3_3_w.png" width="100%">
										</a>
										<div style="margin-top: -15px; text-align: center;">
											<font style="color: white;font-size: 8pt;">부모님끼리</font>
										</div>
									</div>
								</div>
							</div>	
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
						<div class="cal-event">부산</div>
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
					<h3 class="contents-title">여행루트</h3>
				</div>
				<div class="middle-wrapper" style="height: 300px;">
					
		
					<div class="swiper-container" style="margin-top: 20px; height: 250px;">	
							<div class="nolist swiper-wrapper">
								<c:forEach items="${planner}" var="vo">
									<div class="swiper-slide">
					
										<div class="nolist-dot"></div>
										<div class="nolist-line"></div>
										<div class="nolist-dot2"></div>
										<div class="nolist-region">${vo.region}</div>
										<div class="nolist-transfer-comment">${vo.dDate} 이동</div>
										<div class="nolist-transfer">
											<i class="fa fa-train"></i>
										</div>
										
										<div class="swiper-vehicle-wrapper swiper">
											<div class="swiper-vehicle" id="bus">
												<i class="fa fa-bus" style="margin-right: 2px;"></i>
												<font>버스</font>
											</div>
											<div class="swiper-vehicle" id="taxi" style="margin-left: 8px;">
												<i class="fa fa-taxi"></i>
												<font>택시</font>
											</div>
											<div class="swiper-vehicle" id="train">
												<i class="fa fa-train" style="margin-right: 2px;"></i>
												<font>기차</font>
											</div>
											<div class="swiper-vehicle" id="car" style="margin-left: 8px;">
												<i class="fa fa-car"></i>
												<font>자가용</font>
											</div>
										</div>
										
										<div class="notlist-ballon"></div>
										<div class="notlist-ballon2"> 
											<div class="ballon2-title">
												<div>버스로 이동</div>
											</div>
											<div class="ballon2-contents">
												<div><input type="text"></div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
					
						</div>
						
					</div>
				</div>
			</div>
			<!-- 여행루트 끝 -->
			<!-- 세부일정표 시작 -->
			<div class="middle-contents2">
				<div class="midde-title">
					<h3 class="contents-title">일정표</h3>
				</div>
				<div class="middle-wrapper">
					<!-- 체크한 관광지 -->
					<div class="tourlist">
						<div class="swiper-container swiper-container2">
							<div class="swiper-wrapper">
								
									<div class="swiper-slide" style="width: 170px;">
										<div class="card">
										<a>
											<div class="tour-img">
												<img src="https://d3b39vpyptsv01.cloudfront.net/photo/1/2/04e4c4fef731b38e2ef134bafcc38bdc_m.jpg">
													<div class="tour-name">
														<font>대구 이월드</font>
													</div>
											</div>
										</a>
										<a>
											<div class="tour-add">
												<font><i class="fa fa-plus"></i>일정추가</font>
											</div>
										</a>
										</div>
									</div>
									
									<div class="swiper-slide">
										<div class="card">
										<a>
										<div class="tour-img">
											<img src="https://d3b39vpyptsv01.cloudfront.net/photo/1/2/04e4c4fef731b38e2ef134bafcc38bdc_m.jpg">
												<div class="tour-name">
													<font>대구 이월드</font>
												</div>
											</div>
										</a>
										<a>
											<div class="tour-add">
												<font><i class="fa fa-plus"></i>일정추가</font>
											</div>
										</a>
										</div>
									</div>
									
									<div class="swiper-slide">
										<div class="card">									
										<a>
										<div class="tour-img">
											<img src="https://d3b39vpyptsv01.cloudfront.net/photo/1/2/04e4c4fef731b38e2ef134bafcc38bdc_m.jpg">
												<div class="tour-name">
													<font>대구 이월드</font>
												</div>
											</div>
										</a>
										<a>
											<div class="tour-add">
												<font><i class="fa fa-plus"></i>일정추가</font>
											</div>
										</a>
										</div>
									</div>
									
									<div class="swiper-slide">
										<div class="card">
										<a>
										<div class="tour-img">
											<img src="https://d3b39vpyptsv01.cloudfront.net/photo/1/2/04e4c4fef731b38e2ef134bafcc38bdc_m.jpg">
												<div class="tour-name">
													<font>대구 이월드</font>
												</div>
											</div>
										</a>
										<a>
											<div class="tour-add">
												<font><i class="fa fa-plus"></i>일정추가</font>
											</div>
										</a>
										</div>
									</div>
									
									<div class="swiper-slide">
										<div class="card">
										<a>
										<div class="tour-img">
											<img src="https://d3b39vpyptsv01.cloudfront.net/photo/1/2/04e4c4fef731b38e2ef134bafcc38bdc_m.jpg">
												<div class="tour-name">
													<font>대구 이월드</font>
												</div>
											</div>
										</a>
										<a>
											<div class="tour-add">
												<font><i class="fa fa-plus"></i>일정추가</font>
											</div>
										</a>
										</div>
									</div>
									
									<div class="swiper-slide">
										<div class="card">
										<a>
										<div class="tour-img">
											<img src="https://d3b39vpyptsv01.cloudfront.net/photo/1/2/04e4c4fef731b38e2ef134bafcc38bdc_m.jpg">
												<div class="tour-name">
													<font>대구 이월드</font>
												</div>
											</div>
										</a>
										<a>
											<div class="tour-add">
												<font><i class="fa fa-plus"></i>일정추가</font>
											</div>
										</a>
										</div>
									</div>
									
								
								
							</div>
						</div>
					</div>
					<!-- 일정표 -->
					<div class="schedule-wrapper">
						<div class="swiper-container">
							<ul class="swiper-wrapper nolist" style="margin-left: -40px;">
								<!-- li 하나 -->
								<li class="swiper-slide schedule-li" style="height: 560px;">
									<div class="schedule-top">
										<div class="schedule-top2">
											<a>
												<div class="schedule-map">
													<img src="https://www.stubbyplanner.com/img_v15/icon_map.png">
													<div class="schedule-map-title">지도</div>
												</div>
											</a>
										</div>
										<div class="sbold">1/17
											<span style="font-size: 10pt; color: #c0c0c0">목, 첫쨋날</span>
										</div>
										<div class="sarea">
											<div style="line-height: 110%; height: 32px;">부산(첫쨋날)</div>
										</div>
									</div>
									<div class="schedule-body">
										<div class="schedule-body-row">0~9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">10
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">11
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">12
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">13
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">14
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">15
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">16
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">17
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">18
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">19
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20-24
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">숙소
											<div class="schedule-body-content"></div>
										</div>
									</div>
								</li>
								<!-- li 하나 -->
								<li class="swiper-slide schedule-li" style="height: 560px;">
									<div class="schedule-top">
										<div class="schedule-top2">
											<a>
												<div class="schedule-map">
													<img src="https://www.stubbyplanner.com/img_v15/icon_map.png">
													<div class="schedule-map-title">지도</div>
												</div>
											</a>
										</div>
										<div class="sbold">1/18
											<span style="font-size: 10pt; color: #c0c0c0">금, 둘쨋날</span>
										</div>
										<div class="sarea">
											<div style="line-height: 110%; height: 32px;">부산(둘쨋날)</div>
										</div>
									</div>
									<div class="schedule-body">
										<div class="schedule-body-row">0~9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">10
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">11
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">12
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">13
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">14
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">15
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">16
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">17
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">18
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">19
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20-24
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">숙소
											<div class="schedule-body-content"></div>
										</div>
									</div>
								</li>
								<!-- li 하나 -->
								<li class="swiper-slide schedule-li" style="height: 560px;">
									<div class="schedule-top">
										<div class="schedule-top2">
											<a>
												<div class="schedule-map">
													<img src="https://www.stubbyplanner.com/img_v15/icon_map.png">
													<div class="schedule-map-title">지도</div>
												</div>
											</a>
										</div>
										<div class="sbold">1/19
											<span style="font-size: 10pt; color: #c0c0c0">토, 셋쨋날</span>
										</div>
										<div class="sarea">
											<div style="line-height: 110%; height: 32px;">포항(셋쨋날)</div>
										</div>
									</div>
									<div class="schedule-body">
										<div class="schedule-body-row">0~9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">10
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">11
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">12
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">13
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">14
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">15
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">16
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">17
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">18
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">19
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20-24
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">숙소
											<div class="schedule-body-content"></div>
										</div>
									</div>
								</li>
								<!-- li 하나 -->
								<li class="swiper-slide schedule-li" style="height: 560px;">
									<div class="schedule-top">
										<div class="schedule-top2">
											<a>
												<div class="schedule-map">
													<img src="https://www.stubbyplanner.com/img_v15/icon_map.png">
													<div class="schedule-map-title">지도</div>
												</div>
											</a>
										</div>
										<div class="sbold">1/17
											<span style="font-size: 10pt; color: #c0c0c0">목, 첫쨋날</span>
										</div>
										<div class="sarea">
											<div style="line-height: 110%; height: 32px;">부산(첫쨋날)</div>
										</div>
									</div>
									<div class="schedule-body">
										<div class="schedule-body-row">0~9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">10
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">11
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">12
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">13
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">14
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">15
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">16
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">17
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">18
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">19
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20-24
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">숙소
											<div class="schedule-body-content"></div>
										</div>
									</div>
								</li>
								<!-- li 하나 -->
								<li class="swiper-slide schedule-li" style="height: 560px;">
									<div class="schedule-top">
										<div class="schedule-top2">
											<a>
												<div class="schedule-map">
													<img src="https://www.stubbyplanner.com/img_v15/icon_map.png">
													<div class="schedule-map-title">지도</div>
												</div>
											</a>
										</div>
										<div class="sbold">1/17
											<span style="font-size: 10pt; color: #c0c0c0">목, 첫쨋날</span>
										</div>
										<div class="sarea">
											<div style="line-height: 110%; height: 32px;">부산(첫쨋날)</div>
										</div>
									</div>
									<div class="schedule-body">
										<div class="schedule-body-row">0~9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">9
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">10
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">11
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">12
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">13
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">14
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">15
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">16
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">17
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">18
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">19
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">20-24
											<div class="schedule-body-content"></div>
										</div>
										<div class="schedule-body-row">숙소
											<div class="schedule-body-content"></div>
										</div>
									</div>
								</li>
								
							</ul>
						</div>
						
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

		$('.map-peopleType').click(function(){
			
			$('.map-peopleType').toggleClass("peopleTypeSwiper");
			$('.swiper-before').toggleClass("swiper");
			$('.swiper-modal').toggleClass("swiper");	
		});

		
		$('.nolist-transfer').click(function(){
			$('.swiper-vehicle-wrapper').toggleClass("swiper");
		});



		/* swiper */
		   var swiper = new Swiper('.swiper-container', {
		      slidesPerView: 5,
		      spaceBetween: 0,
		      freeMode: true,
		      pagination: {
		        el: '.swiper-pagination',
		        clickable: true,
		      },
		    });

		   var swiper = new Swiper('.swiper-container2', {
			      slidesPerView: 7,
			      spaceBetween: 0,
			      freeMode: true,
			      pagination: {
			        el: '.swiper-pagination',
			        clickable: true,
			      },
			    });
			
		
	</script>
</body>
</html>