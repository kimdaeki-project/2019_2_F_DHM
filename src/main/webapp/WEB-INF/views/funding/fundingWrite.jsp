<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DHM Planner</title>
 
<c:import url="./template/fundingBoot.jsp" />
<c:import url="./template/summernote.jsp" />
<link rel="stylesheet"  href="../css/basic.css">
<%-- <c:import url="./template/ckeditor.jsp" /> --%>
</head>
<body>
<c:import url="../template/nav.jsp"/>
	<div class="container">
		<h1>Funding Write Form</h1>
		<c:import url="./template/fundingWriteForm.jsp" />	

	</div>
<script type="text/javascript" src="../js/summernote.js" ></script>
<script type="text/javascript">
	$("#re").click(function(){
		location.href= "./fundingList";
		});

	$("#write").click(function() {
		if($("#name").val() == ""){
			alert("펀딩의 이름을 입력해주세요.");
			$("#name").focus();
		} else if($("#contents").val() == ""){
			alert("펀딩의 내용을 입력해주세요.");
			$("#contents").focus();
		} else if($("#price").val() == ""){
			alert("펀딩의 금액을 입력해주세요.");
			$("#price").focus();
		} else if($("#goal").val() == ""){
			alert("펀딩의 목표 금액을 입력해주세요.");
			$("#goal").focus();
		} else if($("#start").val() == ""){
			alert("여행의 시작 날짜를 선택해주세요.");
			$("#start").focus();
		} else if($("#time1").val() == ""){
			alert("여행의 시작 시간을 선택해주세요.");
			$("#time1").focus();
		} else if($("#end").val() == ""){
			alert("여행의 마침 날짜를 선택해주세요.");
			$("#end").focus();
		} else if($("#time2").val() == ""){
			alert("여행의 마침 시간을 선택해주세요.");
			$("#time2").focus();
		} else if($("#people").val() == "" || $("#people").val() == "0"){
			alert("펀딩의 최대 참여 인원을 입력해주세요.");
			$("#people").focus();
		} else {
			$("#frm").submit();
		}
	});
</script>

</body>
</html>