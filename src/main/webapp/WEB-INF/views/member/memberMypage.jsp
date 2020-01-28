<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="./membercss.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container" 
	style="height: 100px; background-color:#ff9c9c; 
	width: 1903px; height: 54px; position: fixed; top: 0;"></div>

	<!-- B ->> M ->> S boss grade-->
	<form action="./memberMypage"  method="POST">
	<div class="mypagemain"><!-- b boss -->
		<div class="mypagemain3"><!-- m-1 boss -->
		
		</div><!-- m boss -->
		
		<div class="mypagemain2"><!-- m-2 boss -->
		
			<div class="mypage1"><!-- s-1 boss -->
				<div class="mypage1-1">
					<a href="#"><img src="../imgs/dog.jpg" class="mypage1-1-1"></a>
				</div>
				<div class="mypage1-2">
					<div class="mypage1-2-1">
						<p style="font-size: 18px; font-weight: 700; margin-top: 10px; text-align: center;">${member.id}</p>
					</div>
					<div class="mypage1-2-2">
						<p class="mypage1-2-2-1">${member.grade}</p>
					</div>  
				</div>
			</div>
		
			<div class="mypage2"><!-- s-2 boss -->
				<div class="mypage2-1">
					<div class="mypage2-1-1"><p class="mypage2-1-1-1">${member.gender}</p><p class="mypage2-1-1-3">${member.birth}</p></div>
				</div>
				<div class="mypage2-2"></div>
				<div class="mypage2-3"></div>
			</div>
			
			<div class="mypage3"><!-- s-3 boss -->
				<div class="mypage3-1"></div>
				<div class="mypage3-2"></div>
				<div class="mypage3-3"></div>
				<div class="mypage3-4"></div>
				<div class="mypage3-5"></div>
			</div>
		
		</div>
		
	</div><!-- b boss -->
	</form>
	
	<div class="container" 
	style="background-color: white; width: 1903px; height: 50px; 
	text-align: center; line-height: 50px; font-size: 14px;">
	© DHM PLANNER 2020
	</div>

<script type="text/javascript">
	$(function(){
		//등급 출력 변경
 		if(${member.grade} == 0){
	   	 $('.mypage1-2-2-1').html('slave');
		}else{
			if(${member.grade} == 1){
				$('.mypage1-2-2-1').html('admin');
				}
			}
		});

	$(function(){
		//성별 출력 변경
 		if(${member.gender} == 1){
	   	 $('.mypage2-1-1-1').html('male');
		}else{
			if(${member.gender} == 2){
				$('.mypage2-1-1-1').html('female');
				}
			}
		});

	//mypage2-1-1-3
		
		//생년 출력 변경
		//substring  >> 문자열 추출
			
		$(document).ready(function(){
			 var mbirth = $( '.mypage2-1-1-3' ).text().substring( 0, 4 );
			 $( '.mypage2-1-1-3' ).text(mbirth);

			});

			

			 
		







</script>

</body>
</html>