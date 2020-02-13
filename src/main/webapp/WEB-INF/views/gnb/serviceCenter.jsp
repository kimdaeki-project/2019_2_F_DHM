<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
<link rel="icon" href="../imgs/logos/logo-fav.ico">
</head>
<body>
<c:import url="../template/nav.jsp"/>
	<div class="container">
		<h3><span style="color: green;"></span>고객센터</h3>
		<p style="color: #5d5d5d;">FAQ를 확인후 해소되지 않는 문의사항은 하단의 상담원 문의를 통해 질문해주세요.</p>
		<div class="section marginTop50px" >
			<div class="tab">
				<ul>
					<li id="li_tab1" class="tab_active">펀딩</li>
					<li id="li_tab2">플래너</li>
<!-- 					<li id="li_tab3">예약완료</li> -->
<!-- 					<li id="li_tab4">취소/환불</li> -->
				</ul>
			</div>
		</div>
	</div>
<!-- 	------------------------------------------------------------------------------------- -->
	<div class="container">
	<!-- tab1 -->
		<div class="tab_contents" id="tab1">
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">여러 상품을 예약한 다음에 총 금액을 한번에 입금해도 되나요?</div>
				<div class="panel-footer">네. 다만 예약자명과 입금자명이 모두 동일하게 입금해 주셔야 확인이 가능합니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">카톡 페이 나 토스 앱으로 결제가 가능한가요?</div>
				<div class="panel-footer">네. 예약완료후 전송되는 문자와 이메일상에 있는 계좌정보를 복사해 카톡페이 > 송금하기 혹은 토스 송금하기를 통해 결제가 가능합니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">여행중에도 카톡페이, 토스앱으로 결제가 가능한가요?</div>
				<div class="panel-footer">네 가능합니다. 다만 카카오송금 혹은 토스송금 시도 시, 해외유심을 사용하고 계실 경우에는 해당앱의 인증문제로 인해 일시적으로 한국유심으로 바꿔서 끼워야 합니다.
은행앱을 이용해 송금하실 경우에는 은행에 따라 해외유심으로도 송금이 가능합니다.
단, 한국 시간으로 밤 12시~12시 30분 사이에는 은행전산망 점검으로 인해 송금이 불가할 수 있으므로 12시 30분 이후에 다시 시도해주시기 바랍니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">해외국적 소지자/재외국민일 경우 어떻게 결제하나요?</div>
				<div class="panel-footer">해외국적 소지자/재외국민이실 경우에는 카카오톡 아이디 stubby2496으로
메시지를 보내주시면 Paypal 결제(카드가능) 링크를 제공해드립니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">현금 영수증은 어떻게 발급 받을 수 있나요?</div>
				<div class="panel-footer">국외여행업의 경우, 현금영수증 의무 발행업종은 아니므로, 고객 요청에 따라 발급이 진행됩니다. 필요시 카톡 아이디 stubby2496으로 투어결제후 요청해주세요.
현금영수증 의무 발행업종</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">카드 결제는 불가능한가요?</div>
				<div class="panel-footer">카톡페이송금, 토스 송금, 은행 무통장입금만 지원하고 있습니다.
최저가공급을 위해 지속적으로 노력하고 있으며, 최저가 상품이라 하더라도 상품에 따라 최대 8%의 추가 가격 할인혜택(얼리버드, 결합할인등)을 제공하고 있습니다.

			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">해외상품의 경우, 원화로 표기되는데 기준환율은 자체환율 기준이 있나요?</div>
				<div class="panel-footer"> 기준환율은 외국환은행이 제공하는 매매기준 환율보다 낮은 수준으로 국내외 모든 업체의 기준환율보다 낮은 수준입니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">해외유심으로 입금 시도 시 오류가 납니다. 어떻게 해결하나요?	</div>
				<div class="panel-footer">카카오송금 혹은 토스송금 시도 시, 해외유심을 사용하고 계실 경우에는
원활한 송금을 위해 일시적으로 한국유심으로 바꿔 끼우시는 것을 권장합니다.

은행앱을 이용해 송금하실 경우에는 은행에 따라 해외유심으로도 송금이 가능합니다.
단, 한국 시간으로 밤 12시~12시 30분 사이에는 은행전산망 점검으로 인해 송금이 불가할 수 있으므로 12시 30분 이후에 다시 시도해주시기 바랍니다.</div>
			</div>
			
		</div>
	<!-- tab2 -->
		<div class="tab_contents" id="tab2">
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">왜 입금 후에 확정 단계가 진행되나요?</div>
				<div class="panel-footer">플래너는 고객님과 현지업체의 중개업자로서, 고객님이 예약 후 입금을 해 주셔야 투어 진행 의사가 있는 것으로 간주하고 현지업체에 확정을 요청할 수 있습니다. (단순 예약만으로는 투어 진행 의사를 확인하기 어렵습니다.)
*단 사전 상담 및 일정 조율이 필요한 일부 뮤지컬 공연 제외

만약 현지업체의 사정으로 인해 확정 실패 시, 입금해주신 예약금액은 100% 환불이 가능하니 일정이 급하실수록 빠른 입금을 해주시는 것이 확정여부 확인에 도움이 됩니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">투어 확정 대기시간이 얼마나 되나요?</div>
				<div class="panel-footer">영업일 기준 최대 48시간 내에 확정여부를 현지가이드(업체)가 결정하여 안내하기로 되어 있지만, 일반적으로 12시간 내에 많은 투어가 확정되고 있습니다.
만약 희망날짜에 가이드 스케쥴이 불가능할 경우, 다른 가능한 날짜를 안내해 드리며, 희망하실 경우 투어날짜를 조정하실 수 있습니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">만약 투어 확정에 실패할 경우에는 어떻게 되나요?
</div>
				<div class="panel-footer">cont만약 현지업체 사정으로 인해 투어 확정에 실패할 경우, 환불을 받으시거나 비슷한 코스의 다른 투어를 추천 받아 변경하실 수 있습니다.
(이 때 발생하는 차액은 환불 받으실 수 있으며, 초과금이 발생하는 경우에는 차액분만 추가 입금을 받게 됩니다.</div>
			</div>
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-body">입금은 완료했지만 투어가 확정되기 전 직접 취소를 했습니다. 어떻게 환불 받나요?</div>
				<div class="panel-footer">여행자가 여행요금을 결제(지급)한 때로부터 24시간 이내에 여행계약을 철회(취소)하는 경우에는 환불이 가능합니다.
카카오톡 stubby2496 (오전 11시~오후 7시, 한국시간 기준)으로 연락주시면 자세한 환불 안내 도와드리겠습니다.</div>
			</div>
		</div>
	<!-- tab3 -->
<!-- 		<div class="tab_contents" id="tab3"> -->

<!-- 			<div class="panel panel-default"> -->
<!-- 				<div class="panel-body">(최소모객인원이 있는 경우) 최소인원이 모객되지 않을 경우, 어떻게 되나요?</div> -->
<!-- 				<div class="panel-footer">(최소모객인원이 있는 경우) 투어일 기준 D-7일 전까지 현지투어업체에 최소인원 N명(상품페이지 유의사항에 기재된 최소모객인원)이 모객되지 않을 경우가 생길 수 있습니다. -->

<!-- 이 경우, 고객님께 안내 후 100% 환불을 진행해 드리거나 희망하실 경우 다른 날짜로 투어일 조정 요청이 가능합니다.</div> -->
<!-- 			</div> -->

<!-- 			<div class="panel panel-default"> -->
<!-- 				<div class="panel-body">예약완료 후, 변경 혹은 취소를 원할 때는 어떻게 하면 되나요?	</div> -->
<!-- 				<div class="panel-footer">예약이 완료된 이후 변경을 원하실 경우에는 예약완료메일 내에 안내되어 있는 현지업체 연락처로 직접 연락하셔야 변경이 가능합니다. -->
<!-- 현지업체 연락처를 찾기 어려우신 경우 카카오톡 stubby2496 (오전 11시~오후 7시, 한국시간 기준)으로 연락주시면 현지업체 연락처를 안내해 드립니다. -->

<!-- 예약 완료 후 취소를 원하시는 경우에는 스투비플래너로 연락주시기 바랍니다. -->
<!-- 카카오톡 stubby2496/ stubbyteam@gmail.com/ 02-886-0982 -->
<!-- 예약을 취소하실 경우에는 예약하신 해당 [상품정보 페이지]내의 예약취소/환불에 대한 내용을 꼭 확인해주시기 바랍니다.</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	<!-- tab4 -->
<!-- 		<div class="tab_contents" id="tab4"> -->

<!-- 			<div class="panel panel-default"> -->
<!-- 				<div class="panel-body">슈퍼얼리버드/얼리버드는 환불이 불가능한가요?</div> -->
<!-- 				<div class="panel-footer">'얼리버드'가격으로 구매시 적용되는 취소/환불 규정은 해당 상품페이지 내의 취소/환불규정과 동일하며, 별도의 변경 수수료 없이 날짜변경도 요청이 가능합니다. -->

<!-- '슈퍼얼리버드' 가격은 상품과 기간에 따라 최대 30%의 추가할인이 제공되는 특약조건으로,고객 개인사유로 취소/환불은 불가합니다. <br>(단, 날씨로 인해 투어가 불가하거나 업체측 사유로 취소 시에는 전액환불가능/슈퍼 얼리버드로 구매하신 투어의 날짜 변경을 희망하실 경우, 일반 판매가와의 차액을 수수료로 지불하실 경우 날짜 변경이 가능합니다.) -->
<!--  <br><br> -->
<!-- 예) 일반 판매가 10만원 상품을 슈퍼얼리버드(2개월 전) 가격으로 30% 할인된 7만원에 구매 시,추후 날짜변경 희망시에는 차액 3만원을 지불하신 후 날짜변경이 가능합니다. -->
<!-- <br><br> -->
<!-- ※ 얼리버드/슈퍼얼리버드: 여행계획을 사전에 짜는 꼼꼼한 스투비플래너 고객들을 대상으로, 성수기에 빠르게 마감되는 인기 투어들을 사전에 확정받으실 수 있도록 투어를 미리 구매하실 경우 기존 판매가보다 최대 30% 할인혜택을 제공하는 스투비플래너의 가격정책입니다. -->
<!-- *일부 투어, 티켓류의 상품 제외</div> -->
<!-- 			</div> -->

<!-- 			<div class="panel panel-default"> -->
<!-- 				<div class="panel-body">투어 취소/환불 규정이 어떻게 되나요?</div> -->
<!-- 				<div class="panel-footer">여행자는 가이드약관 제16조 제2항에 따라 여행요금 지급이 이루어진 후 투어 개시일 이전에 여행계약을 임의로 해제하는 경우, 해제 통보 시점에 관한 다음 각 호의 기준에 따라 여행요금이 환불됩니다. -->
<!-- 해제 통보 시점은 환불요청서가 스투비 플랫폼에 접수된 시간 또는 웹싸이트 하단에 기재된 대표 이메일(stubbyteam@gmail.com)을 통하여 환불요청 내용이 기록된 시간을 기준으로 합니다. -->
<!-- <br><br> -->
<!-- - 여행시작 30일전 (~30) 까지 통보시: 여행 요금 전액 환불<br> -->
<!-- - 여행시작 20일 전까지 (29~20) 통보시: 여행요금에서 가이드 요금의 10%와 스투비 수수료 공제 후 환불<br> -->
<!-- - 여행시작 6일 전까지 (19~6) 통보시: 여행요금에서 가이드 요금의 15%와 스투비 수수료 공제 후 환불<br> -->
<!-- - 여행시작 1 일 전까지 (1~5) 통보시: 여행요금에서 가이드 요금의 20%와 스투비 수수료 공제 후 환불<br> -->
<!-- - 여행시작 시간 기준 24시간 이내 통보시: 여행요금에서 가이드 요금의 50%와 스투비 수수료 공제 후 환불<br> -->
<!-- <br> -->
<!-- 다만, 위의 규정에도 불구하고 다음의 경우에는 예외로 합니다. -->
<!-- 1) 여행자가 여행요금을 결제(지급)한 때로부터 24시간 이내에 여행계약을 철회(취소)하는 경우와 여행자가 투어 예약 후 가이드가 확정되기 전에 취소하는 경우는 여행요금을 전액 환불합니다. -->
<!-- 단, 여행자가 여행요금을 결제하였다고 하더라도 해당 시점으로부터 24시간 이내 여행이 시작될 경우는 전액 환불 대상에서 제외합니다. -->
<!-- 2) 상품의 특성에 따라 현지 지불금으로 지불되어야 하는 금액이 있는 경우 해당 현지 지불금액의 환불에 대하여는 각 상품의 상세설명보기에서 별도로 고지한 취소환불 약관을 적용합니다. 상품페이지에 기재된 환불규정이 있을 경우, 해당 내용이 위의 내용보다 우선합니다.</div> -->
<!-- 			</div> -->
			
<!-- 		</div>	 -->
	<h4 class="marginTop50px"> 맞춤여행 의뢰관련 문의</h4>
		<p style="color: #5d5d5d;">카톡 아이디 stubbyagent 로 연락주시거나 유선번호 02-886-0982 내선번호 1번으로 연락하셔서 고객님 성함을 알려주시면 담당플래너와 연결이 가능합니다.</p>
		
		<h4 class="marginTop50px">플래너 서비스 이용 관련 문의</h4>
		<p style="color: #5d5d5d;"><a href="../qna/qnaList" class="aNodeco">온라인 1:1 문의 게시판</a> 혹은 stubbyteam@gmail.com 으로 문의사항을 남겨주세요.</p>	
	</div>
	
<script type="text/javascript">
$(document).ready(function(){
	$('#tab4').hide();
	$('#tab3').hide();
	$('#tab2').hide();
});

$('#li_tab1').click(function(){
	$('.tab_contents').hide();
	$('#tab1').show();
	$('.tab_active').removeClass();
	$(this).addClass("tab_active");
});
$('#li_tab2').click(function(){
	$('.tab_contents').hide();
	$('#tab2').show();
	$('.tab_active').removeClass();
	$(this).addClass("tab_active");
});
$('#li_tab3').click(function(){
	$('.tab_contents').hide();
	$('#tab3').show();
	$('.tab_active').removeClass();
	$(this).addClass("tab_active");
});
$('#li_tab4').click(function(){
	$('.tab_contents').hide();
	$('#tab4').show();
	$('.tab_active').removeClass();
	$(this).addClass("tab_active");
});
// $('#tab2').click(function(){
// 	$('#tab2').show();
// });
// $('#tab3').click(function(){
// 	$('#tab3').show();
// });
// $('#tab2').click(function(){
// 	$('#tab2').show();
// });

$('.panel').click(function(){
 	//$(this>.panel-footer).slideToggle();
});
</script>
</body>
</html>