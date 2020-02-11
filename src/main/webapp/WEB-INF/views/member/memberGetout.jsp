<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- 버튼 bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../css/basic.css">
<link rel="stylesheet" href="../package/css/swiper.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* memberGetout css  Start **********************************************************************/

.getoutmain{
width: 1100px;
height: 250px;
margin-left: 400px;
margin-top: 100px;
background-color: white;
border-bottom: 1px solid #e6e6e6;	
}

.getoutmain1{
width: 1100px;
height: 150px;
margin-left: 400px;
background-color: white;	
}

.getoutmain2{
width: 1100px;
height: 150px;
margin-left: 400px;
background-color: #191919;	
}

.getoutmain2-1{
color: white;
font-size: 11.5px;
padding-left: 15px;
padding-top: 20px;


}

.maintext1{
color: #bfbfbf;	
margin-top: 5px;
text-shadow: none;
font-weight: normal;
font-size: 24px;
line-height: 33px;	
}

.maintext2{
color: darkred;	
font-family: 'NanumGothic';
text-shadow: none;
font-weight: normal;	
font-size: 18px;
margin-top: 20px;
}

.maintext3{
font-size: 12px;
color: darkred;		
margin-top: 20px;
}

a{
	text-decoration: none;
	color: #18ba9b;
}
/* 호버 이벤트 삭제 */
a:hover{
	text-decoration: none;
	font-weight: normal;
}

*{
	margin: 0;
	padding: 0;
	list-style: none;
}

.getoutmain1-1{
padding-top: 30px;
font-size: 13.5px;
}

.getoutmain1-3{
background: #555;
color: #fff;
text-decoration: none;
font-size: 18px;
padding: 10px 25px;
cursor: pointer;
width: 120px;
height: 45px;
text-align: center;
font-size: 17.5px;
margin-top: 10px;
}

.getoutmain1-4{
background: #7f8c8d;
color: #fff;
text-decoration: none;
font-size: 18px;
padding: 10px 25px;
cursor: pointer;
width: 120px;
height: 45px;
text-align: center;
font-size: 17.5px;
margin-top: -45px;
float: left;
margin-left: 130px;
}
/* memberGetout css  End **********************************************************************/
</style>
</head>
<body>
<c:import url="../template/nav.jsp"/>

	<div class="getoutmain">
		<div class="maintext1"><br><h2 class="maintext1">회원 탈퇴하기</h2></div>
		<div class="maintext2"><h4 class="maintext2">탈퇴 시 유의사항</h4></div>
		<div class="maintext3">
			1. 탈퇴하시면 지금까지 작성하신 여행계획에 단 댓글은 자동으로 삭제됩니다.<br>
			2. 작성하신 여행계획은 탈퇴전에 직접 [<a href="${pageContext.request.contextPath}/" target="blank">내여행리스트</a>]에서 삭제해주시기 바랍니다. 삭제방법은 각 여행플래너에서 상단 제목우측에 삭제버튼을 누르시면 됩니다.<br>
			3. [<a href="${pageContext.request.contextPath}/member/memberMypage" target="blank">광장</a>]에 쓰신 글들과 댓글은 자동으로 삭제되지 않으므로 직접 삭제해주시기 바랍니다.<br>
			4. 여행정보와 현지교통과 관련해 집필하신 지식글들은 자동으로 삭제되지 않습니다.</div>
	</div>
	
	<spring:form action="memberGetout" id="Getout" method="post" modelAttribute="memberVO" >
	<div class="getoutmain1">
		<div class="getoutmain1-1">
			비밀번호 : <label for="pw"></label><spring:password path="pw" class="getoutmain1-2" id="pw10"/>
					<input type="hidden" value="${member.id}" name="id">
					<input type="hidden" value="${member.name}" name="name">
					<input type="hidden" value="${member.email}" name="email">
					<input type="hidden" value="${member.gender}" name="gender">
					<input type="hidden" value="${member.birth}" name="birth">
		</div>
		<div>
			<div class="getoutmain1-3">탈퇴하기</div>
			<div class="getoutmain1-4">취소</div>
		</div>
	</div>
	</spring:form>
	
	<div class="getoutmain2">
		<div class="getoutmain2-1">
			<b>(주)DHM플래너</b> 사업자번호: 02-1577-1577 / 대표: 흥선대원군<br>
			서울특별시 종로구 세종로 1 (DHM플래너)<br>
			대표번호 : +82-2-1577-1577 | 대표이메일 : dhmteam@gmail.com<br>
			운영시간(한국) 11:00 ~ 19:00, 주말/공휴일은 제외.<br>
			DHM플래너는 광고서비스 제공자/예약 시스템의 공급자이며 통신판매의 당사자가 아닙니다. 따라서 DHM플래너는 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.<br>
			2020 © DHMPLANNER. ALL Rights Reserved. 광고/제휴 문의     서비스 문의     개인정보 취급방침     이용약관    광고서비스 이용약관<br>
		</div>
	</div>

</body>
<script type="text/javascript">
//-----------------------------------------------------------------------
//회원 탈퇴 취소 -> 마이페이지로 이동
$(".getoutmain1-4").click(function(){
	
    location.href = "memberMypage";
     	 
	});
//----------------------------------------------------------------------
var pw = $("#pw10").val();
var pw2 = '${member.pw}';

$(".getoutmain1-3").click(function(){
	
var id = '${member.id}';

	if(pw != pw2){
		alert("[password] 비밀번호가 일치하지 않습니다.");
	}else{

		location.href = "./memberGetout?id="+id;
	
		}

	});



</script>
</html>