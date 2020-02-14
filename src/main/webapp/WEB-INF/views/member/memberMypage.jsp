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
<link rel="stylesheet"  href="../css/membercss.css">
<link rel="stylesheet"  href="../css/basic.css">
<meta charset="UTF-8">
<title>DHM Planner</title>
</head>
<body>

   <c:import url="../template/nav.jsp"/>
   
<!--    <div style="height: 100px; background-color:#ff9c9c; width: 100%; height: 54px; position: fixed; top: 0;"></div> -->

   <!-- B ->> M ->> S boss grade-->
   <form action="./memberMypage"  method="POST">
   <div class="mypagemain"><!-- b boss -->
      <div class="mypagemain3"><!-- m-1 boss -->
         <div class="my1" id="my1">
            <div class="my1-1">
               <div class="my1-1-1">
                  <button class="btn btn-warning" id="gomakePlanner" type="button"
                  style="color: white; background-image: linear-gradient(to bottom,#f0ad4e 0,#eb9316 100%);
                    margin-top: 170px; margin-left: 25px; width: 200px; height: 35px; font-weight: 800; line-height: 0;">
                    <font style="font-size: 24px;">+</font>다녀온 여행 등록하기</button>
               </div>
            </div>
         </div>
         
         <div class="my2" id="my2">
         	<div class="my2-1">
				<h4>방명록</h4>







			 </div>
         </div>
         
         <div class="my3" id="my3">
            <div class="my3-1">
               <div class="my3-1-1">
                  <h5>여행중에 잊지못할 경험을 하셨나요?</h5>
                  <h5>답답하고 억울한 상황을 겪으셨다구요?</h5>
                  <h5>잊기전에 리뷰로 남겨, 다음 여행자들과 공유해 보세요!</h5>
               </div>
               <div class="my3-1-2">
                  당신의 리뷰는 당신과 비슷한 지역을 가기위해 여행을 계획중인 사람들에게 노출됩니다.<br>
                  이때 당신이 다녀온 여행이 첨부되기 때문에, 광고리뷰가 넘쳐나는 블로그보다 더 신뢰를 얻게됩니다.
               </div>
               <button type="button" class="my3-1-3"><div class="my3-1-5">리뷰쓰기</div><div class="my3-1-4">+50마일</div></button>
            </div>
         </div>
         
         <div class="my4" id="my4">
            <div class="my4-1">
               <div class="my4-1-1">
                  <div class="my4-1-1-1">
                     <div class="my4-1-1-1-1">자기소개</div>
                  </div>
                  <div class="my4-1-1-2">
                     <div class="my4-1-1-1-2">${member.introduce}</div>
                  </div>
               </div>
               <div class="my4-1-2">
                  <div class="my4-1-2-1">
                     <div class="my4-1-2-1-1">현재 체류 지역</div>
                  </div>
                  <div class="my4-1-2-2">
                     <div class="my4-1-2-1-2">${member.live}</div>
                  </div>
               </div>
               <div class="my4-1-3">
                  <div class="my4-1-3-1">
                     <div class="my4-1-3-1-1">사용 가능 언어</div>
                  </div>
                  <div class="my4-1-3-2">
                     <div class="my4-1-3-1-2">${member.language}</div>
                  </div>
               </div>
               <div class="my4-1-4">
                  <div class="my4-1-4-1">
                     <div class="my4-1-4-1-1">좋아하는 관광지</div>
                  </div>
                  <div class="my4-1-4-2">
                     <div class="my4-1-4-1-2">${member.tour}</div>
                  </div>
               </div>
               <div class="my4-1-5">
                  <div class="my4-1-4-1">
                     <div class="my4-1-5-1-1">좋아하는 여행테마</div>
                  </div>
                  <div class="my4-1-4-2">
                     <div class="my4-1-5-1-2">${member.tema}</div>
                  </div>
               </div>
               <div class="my4-1-6">
                  <div class="my4-1-6-1">
                        <div class="my4-1-6-1-1">도움을 줄 수 있는 도시</div>
                  </div>
                  <div class="my4-1-6-2">
                     <div class="my4-1-6-1-2">${member.helpcity}</div>
                  </div>
               </div>
            </div>
         </div>
         
         <div class="my5" id="my5">
            <div class="my5-1">
               <div class="my5-1-1">
                  <div class="my5-1-2">
                     <div class="my5-1-2-1"><h4>발견한 도시<h4></div>
                     <div class="my5-1-2-2">아직 직접 발견해서 추가하신 도시가 없습니다.</div>
                  </div>
                  <div class="my5-1-3">
                     <div class="my5-1-3-1"><h4>발견한 스팟</h4></div>
                     <div class="my5-1-3-2">아직 직접 발견해서 추가하신 스팟이 없습니다.<br>
                     추가하고 싶은 스팟이 있으면 위의 검색창에 검색을 한 뒤에 없으면 해당 도시의 가이드북에서 추가하실 수 있습니다.</div>
                  </div>
               </div>
            </div>
         </div>
         
      </div><!-- m boss -->
      
      <div class="mypagemain2"><!-- m-2 boss -->
      
         <div class="mypage1"><!-- s-1 boss -->
            <div class="mypage1-1">
            <!-- 사진 유-무에 따른 사진 변경 -->
            <c:choose>
               <c:when test="${member.memberFilesVO.fname eq null}">
                  <a><img src="../imgs/dog.jpg" class="mypage1-1-1"></a>               
               </c:when>
               <c:otherwise>
                  <a><img src="../imgs/member/${member.memberFilesVO.fname}" class="mypage1-1-1"></a>
               </c:otherwise>
            
            </c:choose>
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
               <button type="button" class="mypage2-2-1">
                  <strong>회원 정보 변경</strong>
               </button>               
               <button type="button" class="mypage2-2-2">
                  <strong>로그아웃</strong>
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
   
   <div class="container" 
   style="background-color: white; width: 1903px; height: 50px; 
   text-align: center; line-height: 50px; font-size: 14px; margin-top: 50px;">
   <b>© DHM PLANNER 2020</b>
   </div>
   
   <div style="height: 50px;"></div>
   
</form>

   <!-- 프로필 변경 화면창 -->
   <div class="asdzxc">
      <div class="asdzxc2">
         <div class="changeprofile">
            <div class="changeprofile2">
               <div class="changeprofile3">프로필 변경</div>
            </div>   
         </div>
         <spring:form action="memberMypage" id="frm3" method="post" modelAttribute="memberVO" >
            <div class="myintroduce">
               <input type="hidden" value="${member.id}" name="id">
               <input type="hidden" value="${member.pw}" name="pw">
               <input type="hidden" value="${member.name}" name="name">
               <input type="hidden" value="${member.email}" name="email">
               <input type="hidden" value="${member.gender}" name="gender">
               <input type="hidden" value="${member.birth}" name="birth">
               <input type="hidden" value="${member.memberFilesVO.fname}" name="fname">
<%--                <input type="hidden" value="${member.memberFilesVO.fnum}" name="fnum"> --%>
<%--                <input type="hidden" value="${member.memberFilesVO.oname}" name="oname"> --%>
               
            <div class="myintroduce-0">
               <div class="myintroduce-1">
                  <div class="myintroduce1-1">자기 소개</div>               
                  <div class="myintroduce1-text">
                     <label for="introduce"></label><spring:input path="introduce" 
                     class="myintroduce1-1-1 myself" id="introduce10" placeholder="간단한 자기 소개 입력해 주시기 바랍니다."/>                                 
                  </div>
               </div>

               <div class="myintroduce-2">
                  <div class="myintroduce2-1">현재 체류 지역</div>
                  <div class="myintroduce2-text">
                     <label for=live></label>
                     <spring:input path="live" class="myintroduce2-1-1 myself" id="live10"  placeholder="도시 ,국가를 입력해 주시기 바랍니다."/>
                  </div>
               </div>
            </div>

            <div class="myintroduce-0-0">
               <div class="myintroduce-3">
                  <div class="myintroduce3-1">사용 가능 언어</div>
                  <div class="myintroduce3-text">
                     <label for="language"></label>
                     <spring:input path="language" class="myintroduce3-1-1 myself" id="language10" placeholder="사용 가능한 언어를 입력해 주시기 바랍니다."/>
                  </div>
               </div>

               <div class="myintroduce-4">
                  <div class="myintroduce4-1">좋아하는 관광지</div>
                  <div class="myintroduce4-text">
                     <label for="tour"></label>
                     <spring:input path="tour" class="myintroduce4-1-1 myself" id="tour" placeholder="좋아하는 관광지를 입력해 주시기 바랍니다."/>
                  </div>
               </div>

               <div class="myintroduce-5">
                  <div class="myintroduce5-1">좋아하는 여행테마</div>
                  <div class="myintroduce5-text">
                     <label for="tema"></label>
                     <spring:input path="tema" class="myintroduce5-1-1 myself" id="tema10" placeholder="좋아하는 여행 테마를 입력해 주시기 바랍니다."/>
                  </div>
               </div>

               <div class="myintroduce-6">
                  <div class="myintroduce6-1">도움을 줄 수 있는 도시</div>
                  <div class="myintroduce6-text">
                     <label for="helpcity"></label>
                     <spring:input path="helpcity" class="myintroduce6-1-1 myself" id="helpcity10" placeholder="여행 경험이 있는 도시, 국가를 입력해 주시기 바랍니다."/>
                  </div>
               </div>
               
            </div>
         </div>
      </spring:form>
         
         <div class="myintroduce-7">
               <div class="myintroduce-7-1">변경</div>
               <div class="myintroduce-7-2">취소</div>
         </div>
         
      </div>
   </div>   
   
   <!-- 프로필 사진변경 화면창 -->
   <form action="memberMypageImg" id="frm4" method="post" enctype="multipart/form-data" >
   <div class="changeimg" >
      <div class="changeimg2">
         <div class="changeimg2-1">
            <div class="changeimg2-1-1">×</div>
         </div>
         <div class="changeimgtext"><h4>PHOTO</h4></div>   
            <!-- 이미지 넣는 버튼  -->   
            <input class="changeimg2-2" type="file" id="input_img" style="width: 300px;height: 30px;" name="files">
            <input type="hidden" value="${member.id}" name="id">
            <input type="hidden" value="${member.pw}" name="pw">
            <input type="hidden" value="${member.name}" name="name">
            <input type="hidden" value="${member.email}" name="email">
            <input type="hidden" value="${member.gender}" name="gender">
            <input type="hidden" value="${member.birth}" name="birth">

         <div class="changeimg2-3">
            <div class="changeimg2-3-1">
               <!-- 이미지 미리보기 창  -->
                  <div class="img_wrap" style="width: 500px; height: 568px;">
                     <c:choose>
                        <c:when test="${member.memberFilesVO.fname eq null}">
                           <a><img id="img" src="../imgs/dog.jpg" class="mypage1-1-1-1" style="width: 498px; height: 568px;"></a>               
                        </c:when>                        
                        <c:otherwise>
                           <img id="img" style="width: 498px; height: 568px;" src="../imgs/member/${member.memberFilesVO.fname}">
                        </c:otherwise>         
                     </c:choose>                     
               </div>
            </div>
         </div>
         
         <div class="introducebox">
            <div class="changeimg2-5">저장</div>
            <div class="changeimg2-4">창닫기</div>
         </div>
         
      </div>
   </div>
   </form>
         
         <c:import url="../template/footer.jsp"/>

<script type="text/javascript">
//-----------------------------------------------------------------------
   //프로필 사진 변경 BOX 사진 미리보기
   var sel_file;
   
   $(document).ready(function(){
      $("#input_img").on("change",handleImgFileSelect);
   });
   
   function handleImgFileSelect(e){
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);
      filesArr.forEach(function(f){
         if(!f.type.match("image.*")){
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
            }
         sel_file = f;
         var reader = new FileReader();
         reader.onload = function(e){
            $("#img").attr("src", e.target.result);
            $("#img").attr("class", "");
            }
         reader.readAsDataURL(f);
         
         });
      }
//-----------------------------------------------------------------------
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
   
//------------------------------------------------------------------------
//프로필 관리 화면창 띄우기
      $('.asdzxc').hide();
      $('.asdzxc2').hide();
      
   $(".mypage2-3-2").click(function(){
      $('.asdzxc').slideDown();
      $('.asdzxc2').slideDown();
   });
   $(".myintroduce-7-2").click(function(){
      $('.asdzxc').slideUp();
      $('.asdzxc2').slideUp();
   });  
      
   $(window).keyup(function(e){
       if(e.keyCode == 27){
         $('.asdzxc').slideUp();
         $('.asdzxc2').slideUp();
       }
   });
   
//------------------------------------------------------------------------   
//프로필 사진 화면창 띄우기
       $('.changeimg').hide();
      $('.changeimg2').hide();
      $(".mypage1-1-1").click(function(){
          $('.changeimg').slideDown();
         $('.changeimg2').slideDown();
      });
      
      $(".changeimg2-1-1").click(function(){
         $('.changeimg2').slideUp();
         $('.changeimg').slideUp();
      });  
      $(".changeimg2-4").click(function(){
         $('.changeimg2').slideUp();
         $('.changeimg').slideUp();
      });  
      $(".mypage2-3-1").click(function(){
          $('.changeimg').slideDown();
         $('.changeimg2').slideDown();
      });
      //esc누르면 slidedown (esc 코드 = 59)
      $(window).keyup(function(e){
          if(e.keyCode == 27){
            $('.changeimg2').slideUp();
            $('.changeimg').slideUp();
          }
      });
      $(window).keyup(function(e){
          if(e.keyCode == 27){
            $('.changeimg2').slideUp();
            $('.changeimg').slideUp();
          }
      });
      
   
//------------------------------------------------------------------------
//프로필 관리 
$(".myintroduce-7-1").click(function(){
   
   document.getElementById('frm3').submit();
});
//프로필 사진 관리
$(".changeimg2-5").click(function(){
   
   document.getElementById('frm4').submit();
});


//------------------------------------------------------------------------
//플레너 이동
$("#gomakePlanner").click(function(){
   
    location.href = "../planner/makePlanner";
         
   });

//회원 정보 변경 이동
$(".mypage2-2-1").click(function(){
   
    location.href = "${pageContext.request.contextPath}/member/memberUpdate";
         
   });
   
//로그아웃 
$(".mypage2-2-2").click(function(){
   
    location.href = "${pageContext.request.contextPath}/member/memberLogout";
         
   });

//리뷰
$(".my3-1-3").click(function(){
   
    location.href = "${pageContext.request.contextPath}/planner/reviewPlanner";
         
   });
</script>
   
</body>
</html>