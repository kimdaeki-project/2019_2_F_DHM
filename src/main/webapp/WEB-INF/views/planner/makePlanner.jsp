<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/makePlanner.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91fb61305af50f444a07659b68d73d1f"></script>
<title>Make Planner</title>
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
						<div style="border-radius:2;border:1px solid #efefef;padding-left:10px;background:#fff;width: 60%; ">
							<span style="padding-left:0px;padding-right:0px;color:#696969;font-size:9pt;"><i class="fa fa-calendar"></i> 출발</span>
							<input style="height:24px; width:70%;font-size:9pt;background:#fff;margin-left:0px;padding-left:5px;padding-top:2px;padding-bottom:2px;color:#c0c0c0;border:0px solid #c0c0c0" id="thedate"  type="text"> 
							
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

<div class="mkp-right">
   <div class="mkp-right-remote">
      <c:choose>
         <c:when test="${member ne null }">
            <div class="mkp-member-btn" onclick="openComplete()">
               <p>작업완료</p>
            </div>
         </c:when>
         <c:otherwise>
            <div class="mkp-guest-btn" onclick="openComplete()">
               <p>GUEST로 작업중</p>
            </div>
         </c:otherwise>
      </c:choose>
      <div id="totalBak">1일</div>
   </div>
   <div class="map" id="map">
   
   </div>
   <div class="map-sky-control">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>

   
</div>

<!--hide ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="chos-sleep">
	<div class="chos-sleep-info">
		<div class="chos-sleep-title"> <font style="font-size: 20px; color: white; font-weight: bold;"><span class="chos-cityName"></span>&nbsp;체류기간 선택 </font>
			<a onclick="closeSleep()" style="color:#fff;font-size:27pt; float: right; cursor: pointer;"><i class="fa fa-times-circle" aria-hidden="true"></i></a>
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
<div class="mkp-complete"> 
	<div class="mkp-compl-inner">
	
		<c:choose>
			<c:when test="${member ne null }">
				<input type="hidden" value="${member.id }" id="member-id">
				<p class="mkp-table-save">플래너 저장
					<a onclick="closeComplete()" style="color:#fff; font-size:27pt; float: right; cursor: pointer;"><i class="fa fa-times-circle" aria-hidden="true"></i></a>
				</p>
			<table class="mkp-table">
				<tbody>
				<tr>
					<td class="mkp-table-title">
						<p>여행명 </p>
					</td>
					<td>
						<input id="mkp-title">
					</td>
				</tr>
				<tr>
					<td class="mkp-table-pepp">
						<p>인원</p>
					</td>
					<td>
						<select id="mkp-people">
								<option>인원선택</option>
								<c:forEach begin="1" end="10" var="p">
								<option value="${p }">${p }명</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="mkp-table-mail">
						<p> 이메일 </p>
					</td>
					<td>
						<input value="${member.email }" id="mkp-email"> 
					</td>
				</tr>
				</tbody>
			</table>
			<button class="mkp-clp-btn" name="make" >저장하기</button>
			</c:when>
			<c:otherwise>
				<input type="hidden" value="guest" id="member-id">
					<p class="mkp-table-save">GUEST 플래너 저장
						<a onclick="closeComplete()" style="color:#fff; font-size:27pt; float: right; cursor: pointer;"><i class="fa fa-times-circle" aria-hidden="true"></i></a>
					</p>
				<table class="mkp-table">
					<tbody>
					<tr>
						<td class="mkp-table-title">
							<p>여행명 </p>
						</td>
						<td>
							<input id="mkp-title">
						</td>
					</tr>
					<tr>
						<td class="mkp-table-pepp">
							<p>인원</p>
						</td>
						<td>
							<select id="mkp-people">
									<option>인원선택</option>
									<c:forEach begin="1" end="10" var="p">
									<option>${p }명</option>
									</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="mkp-table-mail">
							<p> 이메일 </p>
						</td>
						<td>
							<input type="email" id="mkp-emial">
						</td>
					</tr>
					</tbody>
				</table>
				<button class="mkp-clp-btn">저장하기</button>
				<p style="font-size: 11px; text-align: center; margin-top: 10px;">GUEST 플래너는 누구나 접근 가능하며 임의로 수정 될 수 있습니다.</p>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!--hide ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</section>
<script src="../js/cityList.js"></script>
<script src="../js/makePlanner.js"></script>
</body>
</html>