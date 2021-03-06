<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../imgs/logos/logo-fav.ico">
<meta charset="UTF-8">
<title>DHM Planner</title>
<link rel="stylesheet"  href="../css/funding.css">
<c:import url="./template/fundingBoot.jsp" />
<link rel="stylesheet"  href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div class="container" style="min-height: 719px;">
<c:choose>
<c:when test="${vo.size() eq 0 }">
	<a href="fundingList">
		<img width="60%" height="100%" src="../imgs/no-pFunding.png" style="left: 22%; position: relative;">
	</a>
</c:when>
<c:otherwise>
<c:forEach items="${vo}" var="list" varStatus="i">
<div class="fj_list" >
	<div>
		<div>
			<a href="./myFundingSelect?num=${list.fundingVO.num}" class="fj_l">
				<div class="fj_block">
					<div class="fj_inner_area">
						${i.index+1}
					</div>
					<div class="fj_line"></div>
					<div class="fj_inner_area2">
						<div class="fj_inner_area3">
							<div class="fj_inner_area4">
							<div class="fj_inner_img"></div>
								<div class="fj_inner_area4_1">
									<label class="fj_inner_area4_1_1">참여 완료</label>
								</div>
								<div class="fj_inner_area4_2">${vo2[i.index].name}</div>
								<div class="fj_inner_area4_3">펀딩 제안한 아이디 : ${vo2[i.index].id}</div>
								<div class="fj_inner_area4_3">여행 기간 : ${vo2[i.index].startTime} ~ ${vo2[i.index].endTime} </div>
								<div class="fj_inner_area4_4">참여 인원 ${list.participationPeople}명, ${vo2[i.index].price}원을 후원하셨습니다.</div>
							</div>
							<a href="./fundingJoinDelete?num=${list.num}"><div class="fj_inner_area4_1_1" style="width: 50px; padding:10px; color: red; text-align: center; background-color: red;">취소</div></a>

						</div>
					</div>
				</div>
			
			</a>
		</div>
	</div>
</div>
</c:forEach>
</c:otherwise>
</c:choose>

<div style="height: 100px;"></div>
</div>
<c:import url="../template/footer.jsp"/>

<script type="text/javascript">
$("#re").click(function(){
	history.back();
});
</script>
</body>
</html>