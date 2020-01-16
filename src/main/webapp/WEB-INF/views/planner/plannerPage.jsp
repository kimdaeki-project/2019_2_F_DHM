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
					<h3 style="color: black;">여행루트</h3>
				</div>
				<div class="middle-wrapper">
					<div class="row" style="margin-top: 20px;">
								
						<ul class="nolist">
							<li class="">
			
								<div class="nolist-dot"></div>
								<div class="nolist-line"></div>
								<div class="nolist-region">부산</div>
								
								<div class="nolist-transfer-comment">1월 14일 이동</div>
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
							</li>
							
							<li class="">
			
								<div class="nolist-dot"></div>
								<div class="nolist-line"></div>
								<div class="nolist-line2"></div>
								<div class="nolist-region">대구</div>
								<div class="nolist-transfer-comment">1월 14일 이동</div>
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
							</li>
					
					
							<li class="">
								<div class="nolist-dot"></div>
								<div class="nolist-line"></div>
								<div class="nolist-dot2"></div>
								<div class="nolist-line2"></div>
								<div class="nolist-region">서울</div>
								<div class="nolist-transfer-comment">1월 14일 이동</div>
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
								
							</li>
					
						</ul>
						
					</div>
				</div>
			</div>
			<!-- 여행루트 끝 -->
			<!-- 세부일정표 시작 -->
			<div class="middle-contents2">
				<div class="midde-title">
					<h3 style="color: black;">일정표</h3>
				</div>
				<div class="middle-wrapper">
					<div class="tourlist">
						<div>
							<ul class="swiper-wrapper">
								<li class="schedule-list">
									<div>
										<a>
										<div class="tour-img">
											<img src="https://d3b39vpyptsv01.cloudfront.net/photo/1/2/04e4c4fef731b38e2ef134bafcc38bdc_m.jpg">
												<div style="position: absolute; top: 120px; right:0; width: 150px; height: 24px; color: white; font-size: 15px;background:linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,0.3));"">
													<font>대구 이월드</font>
												</div>
											</div>
										</a>
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
		
	</script>
</body>
</html>