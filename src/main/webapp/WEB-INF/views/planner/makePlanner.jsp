<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/makePlanner.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>viewPage</title>
</head>
<body>
<c:import url="../template/boot.jsp"/>
<c:import url="../template/dragJquery.jsp"/>
<section>
<div class="mkp-left">
	<div class="mkp-left-menu">
		<div id="topControllerLeft" style="padding-top:5px;width:75%;float:left;">
			<div style="padding-left:10px;">
				<a href="/"><img src="/imgs/logos/logo_white.png" height="35px"></a>
			</div>
			<div style="height:40px;padding-top:2px;padding-left:4px;">
				<div style="text-align:left;padding-top:5px;padding-left:5px;">
					<div style="padding-right:20px;padding-left:5px;padding-top:1px;">
						<div style="border-radius:2;border:1px solid #efefef;padding-left:10px;background:#fff;width: 50%; ">
							<span style="padding-left:0px;padding-right:0px;color:#696969;font-size:9pt;"><i class="fa fa-calendar"></i> 출발</span>
							<input style="height:24px; width:100px;font-size:9pt;background:#fff;margin-left:0px;padding-left:5px;padding-top:2px;padding-bottom:2px;color:#c0c0c0;border:0px solid #c0c0c0" id="thedate"  type="text"> 
							
<!-- 							<input type="checkbox" id="arr_nextday"><font style="color:#696969;font-size:8pt">+1 도착</font> -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="tripwith">
			<div style="display:block"><img id="tripwith_img" src="/imgs/tripwith/TW_1_3.png" height="43px"></div>
			<div style="font-size:8pt;"><span id="tripwith_txt">타입선택</span> <i class="fa fa-angle-down"></i></div>
		</div>
		<div id="mkp-left-tripwith">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡ trip with ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<div style="padding-bottom:15px;">
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(1,1,'여자혼자')"><img src="/imgs/tripwith/TW_1_1_w.png" width="100%"></a> </div>
					<div style="margin-top:-15px;text-align:center;"> <font style="color:#fff;font-size:8pt">여자혼자</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(1,2,'남자혼자')"><img src="/imgs/tripwith/TW_1_2_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">남자혼자</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(1,3,'커플/신혼')"><img src="/imgs/tripwith/TW_1_3_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">커플/신혼</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(2,1,'여자끼리')"><img src="/imgs/tripwith/TW_2_1_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">여자끼리</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(2,2,'남자끼리')"><img src="/imgs/tripwith/TW_2_2_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">남자끼리</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(2,3,'남녀함께')"><img src="/imgs/tripwith/TW_2_3_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">남녀함께</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(3,1,'아이들과')"><img src="/imgs/tripwith/TW_3_1_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">아이들과</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(3,2,'부모님과')"><img src="/imgs/tripwith/TW_3_2_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">부모님과</font></div>
				</div>
				<div style="float:left;width:33%">
					<div><a href="javascript:selectTripImgs(3,3,'부모님끼리')"><img src="/imgs/tripwith/TW_3_3_w.png" width="100%"></a></div>
					<div style="margin-top:-15px;text-align:center;"><font style="color:#fff;font-size:8pt">부모님끼리</font></div>
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
		<div class="mkp-city-list" style="clear: both;">
			
		</div>
	</div>
</div>
<div class="mkp-right-menu">
	<div class="city-btn-grp">
		<div class="city-btn">
			<button value="인천" class="city-selOne">인천</button>
			<div class="city-btn-info">
				<p>국제공항</p>
				<button class="mkp-ajax">일정 추가</button>
			</div>
		</div>
		<div class="city-btn">
			<button value="서울" class="city-selOne">서울</button>
			<div class="city-btn-info">
				<p>대한민국 수도</p>
				<button class="mkp-ajax">일정 추가</button>
			</div>
		</div>
		<div class="city-btn">
			<button value="대전" class="city-selOne">대전</button>
			<div class="city-btn-info">
				<p>카이스트</p>
				<button class="mkp-ajax">일정 추가</button>
			</div>
		</div>
		<div class="city-btn">
			<button value="부산" class="city-selOne">부산</button>
			<div class="city-btn-info">
				<p>등킨도나스</p>
				<button class="mkp-ajax">일정 추가</button>
			</div>
		</div>
		<div class="city-btn">
			<button value="제주도" class="city-selOne">제주도</button>
			<div class="city-btn-info">
				<p>선물은 감귤초콜렛</p>
				<button class="mkp-ajax">일정 추가</button>
			</div>
		</div>
	 </div>
	<div class="mkp-right-remote" draggable="false">
		<c:choose>
			<c:when test="${member ne null }">
				<div class="mkp-member-btn">
					<p>작업완료</p>
					<div class="mkp-member-hide">
						<p>Planner 제목</p>
						<input id="mkp-pln-title">
						<p>여행 인원</p>
						<select id="mkp-pln-pepp" >
							<c:forEach begin="1" end="10" var="p">
								<option>${p }명</option>
							</c:forEach>
						</select>
					</div>	
				</div>
			</c:when>
			<c:otherwise>
				<div class="mkp-guest-btn">
					<p>GUEST로 작업중</p>
				</div>
			</c:otherwise>
		</c:choose>
		<div>
		</div>
	</div>
</div>
<!--hide ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="chos-sleep">
	<div class="chos-sleep-info">
		<div class="chos-sleep-title"> <font style="font-size: 20px; color: white; font-weight: bold;"><span class="chos-cityName"></span>&nbsp;체류기간 선택 </font>
			<a onclick="closeSleep()" style="color:#fff;font-size:27pt; float: right;"><i class="fa fa-times-circle" aria-hidden="true"></i></a>
		</div>
		<br>
		<br>
		<div class="chos-sleep-list">
			<input type="hidden" id="save-sleep">
			<div class="chos-sleep-opt" title="무"> <font style="font-size: 18px;">무박</font></div>
			<div class="chos-sleep-opt" title="1"> <font style="font-size: 18px;">1박</font></div>
			<div class="chos-sleep-opt" title="2"> <font style="font-size: 18px;">2박</font></div>
			<div class="chos-sleep-opt" title="3"> <font style="font-size: 18px;">3박</font></div>
			<div class="chos-sleep-opt" title="4"> <font style="font-size: 18px;">4박</font></div>
			<div class="chos-sleep-opt" title="5"> <font style="font-size: 18px;">5박</font></div>
			<div class="chos-sleep-opt" title="6"> <font style="font-size: 18px;">6박</font></div>
			<div class="chos-sleep-opt" title="7"> <font style="font-size: 18px;">7박</font></div>
			<div class="chos-sleep-opt" title="8"> <font style="font-size: 18px;">8박</font></div>
			<div class="chos-sleep-opt" title="9"> <font style="font-size: 18px;">9박</font></div>
		</div>
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="mkp-trans-info-ex">
				<div style="padding-top:0px;padding-bottom:0px">
					<div style="float:left;width:29px;height:40px;border-right:3px solid #3ad195;">&nbsp;</div>
					<div style="float:left;width:150px;height:40px;padding-top:10px;margin-left:-25px;">
						<div class="mkp-trans-btn">
							<font style="font-size:9pt;color:#fff"><span class="mkp-trans-chos">선택&nbsp;</span><i class="fa fa-chevron-circle-down"></i></font>
								<div class="mkp-trans-picker">
									<div class="mkp-trans-sct">
										<i class="fa fa-bus"></i>
										<font>버스</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-taxi"></i>
										<font>택시</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-train"></i>
										<font>기차</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-car"></i>
										<font>자차</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-plane"></i>
										<font>항공</font>
									</div>
								</div>
						</div>&nbsp;
					</div>
					
					<div style="clear:both"></div>
				</div>
			</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!--hide ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</section>
<script src="../js/makePlanner.js"></script>
</body>
</html>