<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
</head>
<body>
<c:import url="../template/nav.jsp"/>
	<div class="container">
	
		<h1 style="color: #c9c9c9; border-bottom: 1px solid #c9c9c9; padding-bottom: 10px;">review</h1>
		<div class="section" style="background: gold;">
			<div class="reviewFlexWrapper">
				<div class="reviewWrapper_leftSide">
					<!-- reviewBox -->
					<div class="reviewBox ">
						<div class="reviewMemberImg"><img alt="members_img" src="../images/pixel.jpg" class="reviewMemberImg_img"></div>
						<div class="reviewCommentsWrapper">
							<h5 class="reviewComments_header_info">
								<span>user12</span>
								<span class="reviewComments_header_date">2020-02-03</span>
							</h5>
							<div class="reviewComments_comments">여러 상품을 예약한 다음에 총 금액을 한번에 입금해도 되나요?</div>
						</div>
					</div>
					<!-- reviewBox -->
					<!-- reviewBox -->
					<div class="reviewBox">
						<div class="reviewMemberImg"><img alt="members_img" src="../images/user.jpg" class="reviewMemberImg_img"></div>
						<div class="reviewCommentsWrapper">
							<h5 class="reviewComments_header_info">
								<span>ims330k</span>
								<span class="reviewComments_header_date">2020-02-03</span>
							</h5>
							<div class="reviewComments_comments">네 가능합니다. 다만 카카오송금 혹은 토스송금 시도 시, 해외유심을 사용하고 계실 경우에는 해당앱의 인증문제로 인해 일시적으로 한국유심으로 바꿔서 끼워야 합니다. 은행앱을 이용해 송금하실 경우에는 은행에 따라 해외유심으로도 송금이 가능합니다. 단, 한국 시간으로 밤 12시~12시 30분 사이에는 은행전산망 점검으로 인해 송금이 불가할 수 있으므로 12시 30분 이후에 다시 시도해주시기 바랍니다.</div>
						</div>
					</div>
					<div class="aaaa"></div>
					<!-- reviewBox -->
					<!-- reviewBox -->
					
					
					<form action="./scheduleComment" method="post">
					<div class="reviewBox" >
						<div class="reviewMemberImg"><img alt="members_img" src="../images/user.jpg" class="reviewMemberImg_img"></div>
						<div class="reviewCommentsWrapper">
<!-- 							<form:textarea path="contents" class="contents"/> -->
							<textarea class="contents" name="contents"></textarea>
						</div>
					</div>
					<!-- reviewBox -->
					<button class="button" style="margin-left: 50px;">답글입력</button>
					<input type="text" name="plNum" value="52">
					</form>
					
					
					
					
				</div>
				<div class="reviewWrapper_rightSide">
					<div class="reviewWrapper_rightSide_rel">
						연관정보
					</div>
				</div>
			</div>
		</div>
		
		
		
	</div><!-- container -->
<script type="text/javascript">
	$('.contents').summernote({
		placeholder : 'write contents!',
		tabsize : 2,
		height : 150
	});

// 	$('.button').click(function(){
// 		location.href=""
// 		});
</script>
</body>
</html>