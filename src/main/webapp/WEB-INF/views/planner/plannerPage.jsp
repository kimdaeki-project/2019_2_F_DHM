<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="../css/planner.css">

<c:import url="../template/boot.jsp"/>
</head>
<body>
	<div class="header">
	</div>
	<div class="container">
		<div class="main-container">
			
			<div >
				<h3 class="planner-title">여행제목</h3>
			</div>
			<div class="main-contents">
				<div class="map-wrapper">
					<div class="map">
						지도올자리
						<div class="map-peopleType">
							여자혼자
						</div>
						<div class="map-rootModify">
							루트수정
						</div>
						<div class="map-startDate">
							2020-1-14일 출발
						</div>
						<div class="map-date">
							3일간
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
	<script type="text/javascript">
		function transfer(){
			alert('dd');
		}

	</script>
</body>
</html>