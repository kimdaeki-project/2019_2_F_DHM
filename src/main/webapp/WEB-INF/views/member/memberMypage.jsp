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
<c:import url="./membercss.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div 
	style="height: 100px; background-color:#ff9c9c; 
	width: 100%; height: 54px; position: fixed; top: 0;"></div>

	<!-- B ->> M ->> S boss grade-->
	<form action="./memberMypage"  method="POST">
	<div class="mypagemain"><!-- b boss -->
		<div class="mypagemain3"><!-- m-1 boss -->
			<div class="my1" id="my1"></div>
			<div class="my2" id="my2"></div>
			<div class="my3" id="my3"></div>
			<div class="my4" id="my4"></div>
			<div class="my5" id="my5"></div>
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
				<div class="mypage2-2">
					<button class="mypage2-2-1">
					<strong>0 </strong> Mentees
					</button>					
					<button class="mypage2-2-2">
					<strong>0 </strong> Mentors
					</button>
				</div>
				<div class="mypage2-3">					
  						<button id="mypage2-3-1" type="button" class="btn btn-warning mypage2-3-1" 
  						style="color: white; background-image: linear-gradient(to bottom,#f0ad4e 0,#eb9316 100%);
  						margin-top: 20px; margin-left: 20px;">사진 변경</button>
  					
 						<button id="mypage2-3-2" type="button" class="btn btn-warning mypage2-3-2" 
 						style="color: white; background-image: linear-gradient(to bottom,#f0ad4e 0,#eb9316 100%);
 						margin-top: 20px; margin-left: 10px;">프로필 변경</button>				
				</div>
			</div>
			
			<div class="mypage3"><!-- s-3 boss -->
				<div class="mypage3-1">  	
					<div class="mypage3-1-1">
						여행 
						<span id= "span_all_cnt" class="mypage3-1-2">0</span>                                      
					</div>
				</div>
				<div class="mypage3-2">  	
					<svg style="width: 15px; height: 15px; margin-top: 15px; margin-left: 30px; color : #716e6e"
					aria-hidden="true" focusable="false" data-prefix="fas" data-icon="envelope" role="img" 
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-envelope 
					fa-w-16 fa-spin fa-lg msgbing1"><path fill="currentColor" d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 
					26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 
					113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 
					320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 
					9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 
					40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z"></path></svg>
					<div class="mypage3-2-1">메세지</div>
				</div>
				
				<div class="mypage3-3">	
					<!-- 빙글빙글펜 --> 		
					<svg style="width: 15px; height: 15px; margin-top: 15px; margin-left: 30px; color : #716e6e" 
					aria-hidden="true" focusable="false" data-prefix="far" 
					data-icon="pencil" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" 
					class="svg-inline--fa fa-pencil fa-w-16 fa-spin fa-lg msgbing2"><path fill="currentColor" 
					d="M491.609 73.625l-53.861-53.839c-26.378-26.379-69.076-26.383-95.46-.001L24.91 335.089.329 
					484.085c-2.675 16.215 11.368 30.261 27.587 27.587l148.995-24.582 315.326-317.378c26.33-26.331 
					26.581-68.879-.628-96.087zM120.644 302l170.259-169.155 88.251 88.251L210 391.355V350h-48v-48h-41.356zM82.132 
					458.132l-28.263-28.263 12.14-73.587L84.409 338H126v48h48v41.59l-18.282 18.401-73.586 
					12.141zm378.985-319.533l-.051.051-.051.051-48.03 48.344-88.03-88.03 48.344-48.03.05-.05.05-.05c9.147-9.146 
					23.978-9.259 33.236-.001l53.854 53.854c9.878 9.877 9.939 24.549.628 33.861z" class=""></path></svg>
					<div class="mypage3-3-1">리뷰</div>  	
				</div>
				
				<div class="mypage3-4">			
					<svg style="width: 15px; height: 15px; margin-top: 15px; margin-left: 30px; color : #716e6e" 
					aria-hidden="true" focusable="false" data-prefix="far" data-icon="address-card" role="img" 
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="msgbing3 svg-inline--fa fa-address-card 
					fa-w-18 fa-spin fa-lg"><path fill="currentColor" d="M528 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 
					48 48 48h480c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm0 400H48V80h480v352zM208 256c35.3 0 64-28.7 
					64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm-89.6 128h179.2c12.4 0 22.4-8.6 
					22.4-19.2v-19.2c0-31.8-30.1-57.6-67.2-57.6-10.8 0-18.7 8-44.8 8-26.9 0-33.4-8-44.8-8-37.1 0-67.2 25.8-67.2 
					57.6v19.2c0 10.6 10 19.2 22.4 19.2zM360 320h112c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8H360c-4.4 0-8 3.6-8 8v16c0 
					4.4 3.6 8 8 8zm0-64h112c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8H360c-4.4 0-8 3.6-8 8v16c0 4.4 3.6 8 8 
					8zm0-64h112c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8H360c-4.4 0-8 3.6-8 8v16c0 4.4 3.6 8 8 8z" class="">
					</path></svg>
					<div class="mypage3-4-1">프로필</div>
				</div>  	
				
				<div class="mypage3-5">			
					<svg style="width: 15px; height: 15px; margin-top: 15px; margin-left: 30px; color : #716e6e;" 
					aria-hidden="true" focusable="false" data-prefix="far" data-icon="search" role="img" 
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="msgbing4 svg-inline--fa fa-search fa-w-16 fa-spin fa-lg">
					<path fill="currentColor" d="M508.5 468.9L387.1 347.5c-2.3-2.3-5.3-3.5-8.5-3.5h-13.2c31.5-36.5 50.6-84 
					50.6-136C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c52 0 99.5-19.1 136-50.6v13.2c0 3.2 1.3 6.2
					3.5 8.5l121.4 121.4c4.7 4.7 12.3 4.7 17 0l22.6-22.6c4.7-4.7 4.7-12.3 0-17zM208 368c-88.4 
					0-160-71.6-160-160S119.6 48 208 48s160 71.6 160 160-71.6 160-160 160z" class=""></path></svg>
					
					<div class="mypage3-5-1">발견</div>
				</div>  		
			</div>
		
		</div>


				<!-- 4가지 아이콘 기본 = 메세지 -->
				<svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="envelope" role="img"
				 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
				 style="height: 15px; width: 15px; position: relative;left:46px; top: -235px; color : #716e6e;" 
				 class="svg-inline--fa fa-envelope msgbing10 
				 fa-w-16 fa-lg"><path fill="currentColor" d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 26.5-21.5
				 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 
				 113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 
				 320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 
				 9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 
				 40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z"></path></svg>
		
				<!-- 4가지 아이콘 기본 = 리뷰 -->
				<svg style="height: 15px; width: 15px; color : #716e6e; position: relative; left:26px; top: -185px;"
				aria-hidden="true" focusable="false" data-prefix="far" data-icon="pencil" role="img" 
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" 
				class="svg-inline--fa fa-pencil fa-w-16 fa-lg msgbing11">
				<path fill="currentColor" d="M491.609 73.625l-53.861-53.839c-26.378-26.379-69.076-26.383-95.46-.001L24.91
				 335.089.329 484.085c-2.675 16.215 11.368 30.261 27.587 27.587l148.995-24.582 315.326-317.378c26.33-26.331
				 26.581-68.879-.628-96.087zM120.644 302l170.259-169.155 88.251 88.251L210 391.355V350h-48v-48h-41.356zM82.132
				 458.132l-28.263-28.263 12.14-73.587L84.409 338H126v48h48v41.59l-18.282 18.401-73.586 
				 12.141zm378.985-319.533l-.051.051-.051.051-48.03 48.344-88.03-88.03 48.344-48.03.05-.05.05-.05c9.147-9.146
				 23.978-9.259 33.236-.001l53.854 53.854c9.878 9.877 9.939 24.549.628 33.861z"></path></svg>
		
				<!-- 4가지 아이콘 기본 = 프로필 -->
				<svg style="height: 15px; width: 15px; color : #716e6e; position: relative; left:6px; top: -138px;"
				aria-hidden="true" focusable="false" data-prefix="far" data-icon="address-card" role="img" 
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" 
				class="svg-inline--fa fa-address-card fa-w-18 fa-fw fa-lg msgbing12">
				<path fill="currentColor" d="M528 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 
				48h480c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm0 400H48V80h480v352zM208 256c35.3
				0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm-89.6 128h179.2c12.4 0
				22.4-8.6 22.4-19.2v-19.2c0-31.8-30.1-57.6-67.2-57.6-10.8 0-18.7 8-44.8 8-26.9 
				0-33.4-8-44.8-8-37.1 0-67.2 25.8-67.2 57.6v19.2c0 10.6 10 19.2 22.4 19.2zM360 
				320h112c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8H360c-4.4 0-8 3.6-8 8v16c0 4.4 3.6 8 8 
				8zm0-64h112c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8H360c-4.4 0-8 3.6-8 8v16c0 4.4 3.6 8 
				8 8zm0-64h112c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8H360c-4.4 0-8 3.6-8 8v16c0 4.4 3.6 8 
				8 8z" class=""></path></svg>
				
		
				<!-- 4가지 아이콘 기본 = 발견 -->
				<svg style="height: 15px; width: 15px; color : #716e6e; position: relative; left:-12px; top: -89px;"
				aria-hidden="true" focusable="false" data-prefix="far" data-icon="search" role="img" 
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" 
				class="svg-inline--fa fa-search fa-w-16 fa-lg msgbing13">
				<path fill="currentColor" d="M508.5 468.9L387.1 347.5c-2.3-2.3-5.3-3.5-8.5-3.5h-13.2c31.5-36.5
				50.6-84 50.6-136C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c52 0 99.5-19.1 136-50.6v13.2c0 
				.2 1.3 6.2 3.5 8.5l121.4 121.4c4.7 4.7 12.3 4.7 17 0l22.6-22.6c4.7-4.7 4.7-12.3 0-17zM208 368c-88.4 
				0-160-71.6-160-160S119.6 48 208 48s160 71.6 160 160-71.6 160-160 160z"></path></svg>

				<!-- 프로필 관리 창 -->

	</div><!-- b boss -->
	</form>
	
	<div class="asdzxc">
		<div class="asdzxc2"></div>
	</div>			
	
	<div class="container" 
	style="background-color: white; width: 1903px; height: 50px; 
	text-align: center; line-height: 50px; font-size: 14px;">
	© DHM PLANNER 2020
	</div>

<script type="text/javascript">
	//등급 출력 변경
	$(function(){
 		if(${member.grade} == 0){
	   	 $('.mypage1-2-2-1').html('Beginner');
		}else{
			if(${member.grade} == 1){
				$('.mypage1-2-2-1').html('guide');
				}else{
					if(${member.grade} == 2){
						$('.mypage1-2-2-1').html('admin');
					}
				}
			}
		});

	//성별 출력 변경
	$(function(){
 		if(${member.gender} == 1){
	   	 $('.mypage2-1-1-1').html('male');
		}else{
			if(${member.gender} == 2){
				$('.mypage2-1-1-1').html('female');
				}
			}
		});

	//생년 출력 변경
	//substring  >> 문자열 추출			
	$(document).ready(function(){
		 var mbirth = $( '.mypage2-1-1-3' ).text().substring( 0, 4 );
		 $( '.mypage2-1-1-3' ).text(mbirth);
		});

			
//-----------------------------------------------------------------------
//5개 아이콘  회전 제어
$('.msgbing1').hide();
$('.msgbing2').hide();
$('.msgbing3').hide();
$('.msgbing4').hide();

////////
	$("div.mypage3-2").mouseout(function(){
		$('.msgbing10').show();
		$('.msgbing1').hide();	
			
	});	 
		
	$("div.mypage3-2").mouseover(function(){
		$('.msgbing10').hide();
 		$('.msgbing1').show();	
				
	});	
////////
	$("div.mypage3-3").mouseout(function(){
		$('.msgbing11').show();
		$('.msgbing2').hide();			
	});	 
		
	$("div.mypage3-3").mouseover(function(){
		$('.msgbing11').hide();
		$('.msgbing2').show();			
	});	
////////
	$("div.mypage3-4").mouseout(function(){
		$('.msgbing12').show();
		$('.msgbing3').hide();			
	});	 
	
	$("div.mypage3-4").mouseover(function(){
		$('.msgbing12').hide();
		$('.msgbing3').show();			
	});	
////////
	$("div.mypage3-5").mouseout(function(){
		$('.msgbing13').show();
		$('.msgbing4').hide();			
	});	 
	
	$("div.mypage3-5").mouseover(function(){
		$('.msgbing13').hide();
		$('.msgbing4').show();			
	});	
	
//-----------------------------------------------------------------------
//5가지 소분류 클릭 화면 띄우기
	$('.my1').show();
	$('.my2').hide();
	$('.my3').hide();
	$('.my4').hide();
	$('.my5').hide();

	$("div.mypage3-1").click(function(){		
		$('.my1').show();
		
		$('.my2').hide();
		$('.my3').hide();
		$('.my4').hide();
		$('.my5').hide();
	});
	
	$("div.mypage3-2").click(function(){		
		$('.my2').show();
		
		$('.my1').hide();
		$('.my3').hide();
		$('.my4').hide();
		$('.my5').hide();
	});

	$("div.mypage3-3").click(function(){		
		$('.my3').show();
		
		$('.my1').hide();
		$('.my2').hide();
		$('.my4').hide();
		$('.my5').hide();
	});
	
	$("div.mypage3-4").click(function(){		
		$('.my4').show();
		
		$('.my1').hide();
		$('.my2').hide();
		$('.my3').hide();
		$('.my5').hide();
	});	
	
	$("div.mypage3-5").click(function(){		
		$('.my5').show();
		
		$('.my1').hide();
		$('.my2').hide();
		$('.my3').hide();
		$('.my4').hide();
	});
	
//-----------------------------------------------------------------------
//프로필 관리 화면창 띄우기
		$('.asdzxc').hide();
		$('.asdzxc2').hide();
		
	$(".mypage2-3-2").click(function(){
		$('.asdzxc').show();
		$('.asdzxc2').show();
		});














</script>
	
</body>
</html>