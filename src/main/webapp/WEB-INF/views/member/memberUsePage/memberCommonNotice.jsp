<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/imgs/logos/logo-fav.ico">
<!-- boot.jsp jquery만 가져옴 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/css/membercss.css">
<link rel="stylesheet"  href="${pageContext.request.contextPath}/css/basic.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/package/css/swiper.min.css">
<meta charset="UTF-8">
<title>DHM 광고문의</title>
</head>
<body>

	<c:import url="../../template/nav.jsp"/>

	<div style="height: 150px;"></div>

<div class="commonMain">
	<div class="commonMain2">
		<img class="commonimg" src="${pageContext.request.contextPath}/images/CommonNotice.gif">
		<div class="commonbox0"></div>
		
		<div class="commonbox">
			<div class="commondppl">DHM플래너 제휴 문의(광고주)</div>
		</div>
		<div class="commonbox1">
			<div class="commonppl2">상상 속의 여행을 현실로 함께 만들어갈 광고주를 찾습니다.</div>
		</div>
		<div class="commonbox2">* 필수항목</div>
		
	<!-- 입력 div 시작 -->
	<spring:form action="memberUsePage/memberCommonNotice" id="common" method="post" modelAttribute="commonVO" >
		<div class="Ctextbox1">																					<!-- 입력값없을 시 Ctextbox1 css bolder red로 변경  -->
			<div class="nextlevel1">이메일 주소 <font style="color: red;">*</font></div>
			<input type="text" class="freetradeagreement1" name="cemail"  placeholder="연락 받을 이메일주소를 입력하십시오."> 	<!-- 입력값없을 시 freetradeagreement1 css bolder red로 변경  -->
			
			<div class="warringmain1">
				<img class="commonimg1" src="${pageContext.request.contextPath}/images/cap.png">
				<div class="warring1"> 필수 질문입니다!</div>
			</div>
		</div>
	
		<div class="Ctextbox2">
			<div class="nextlevel2">회사명 <font style="color: red;">*</font></div>
			<input type="text" class="freetradeagreement2" name="ccompon" placeholder="회사명을 입력하십시오.">
		
			<div class="warringmain2">
				<img class="commonimg1" src="${pageContext.request.contextPath}/images/cap.png">
				<div class="warring1"> 필수 질문입니다!</div>
			</div>
		</div>
	
		<div class="Ctextbox3">
			<div class="nextlevel3">투어국가 및 도시 <font style="color: red;">*</font></div>
			<input type="text" class="freetradeagreement3" name="ccity" placeholder="투어국가 및 도시를 입력하십시오.">
		
			<div class="warringmain3">
				<img class="commonimg1" src="${pageContext.request.contextPath}/images/cap.png">
				<div class="warring1"> 필수 질문입니다!</div>
			</div>
		</div>
		
		<div class="Ctextbox4">
			<div class="nextlevel4">투어내용 <font style="color: red;">*</font></div>
			<input type="text" class="freetradeagreement4" name="ccintro" placeholder="투어내용을 입력하십시오.">
		
			<div class="warringmain4">
				<img class="commonimg1" src="${pageContext.request.contextPath}/images/cap.png">
				<div class="warring1"> 필수 질문입니다!</div>
			</div>
		</div>
	
		<div class="Ctextbox5">
			<div class="nextlevel5">연락처 <font style="color: red;">*</font></div>
			<input type="text" class="freetradeagreement5" name="cphone" placeholder="연락받을 곳을 입력하십시오.">
			
			<div class="warringmain5">
				<img class="commonimg1" src="${pageContext.request.contextPath}/images/cap.png">
				<div class="warring1"> 필수 질문입니다!</div>
			</div>
		</div>
		</spring:form>	
	<!-- 입력 div 끝 -->
	
	
		<input type="button" class="submitbtn" value="저장">
	
	</div>
</div>



	<c:import url="../../template/footer.jsp"/>
</body>
<script type="text/javascript">
//warring div 숨기기
$(".warringmain1").hide(); 
$(".warringmain2").hide();
$(".warringmain3").hide();
$(".warringmain4").hide();
$(".warringmain5").hide();
//---------------------------------------------------------------------
//입력값이 없을 시 css 변경
//1
var textemail = $(".freetradeagreement1").val();

$(".freetradeagreement1").change(function(){
	textemail = $(".freetradeagreement1").val();
});
	

    $('.freetradeagreement1').focus(function() {     
    	$(".warringmain1").hide();
		$('.Ctextbox1').css('border-color','gray');  
		$('.freetradeagreement1').css('border-bottom-color','gray');
         
    });
	
    $('.freetradeagreement1').blur(function(){
        
		if(textemail == ""){
				
       	$(".warringmain1").show();
       	$('.Ctextbox1').css('border-color','red');
       	$('.freetradeagreement1').css('border-bottom-color','red');

		} else{
			
			if(textemail != ""){

			$(".warringmain1").hide();
			$('.Ctextbox1').css('border-color','gray');  
			$('.freetradeagreement1').css('border-bottom-color','gray');
				}
			 
			}

	 });	   		
		
//2
var textemail2 = $(".freetradeagreement2").val();

$(".freetradeagreement2").change(function(){
	textemail2 = $(".freetradeagreement2").val();
});
	

    $('.freetradeagreement2').focus(function() {     
		$(".warringmain2").hide();
		$('.Ctextbox2').css('border-color','gray');  
		$('.freetradeagreement2').css('border-bottom-color','gray');
    });
	
    $('.freetradeagreement2').blur(function(){
        
		if(textemail2 == ""){
				
       	$(".warringmain2").show();
       	$('.Ctextbox2').css('border-color','red');
       	$('.freetradeagreement2').css('border-bottom-color','red');
		} else{
			
			if(textemail2 != ""){

			$(".warringmain2").hide();
			$('.Ctextbox2').css('border-color','gray');  
			$('.freetradeagreement2').css('border-bottom-color','gray');
				}
			 
			}

	 });	   	

  //3
    var textemail3 = $(".freetradeagreement3").val();

    $(".freetradeagreement3").change(function(){
    	textemail3 = $(".freetradeagreement3").val();
    });
    	
        $('.freetradeagreement3').focus(function() {     
        	$(".warringmain3").hide();
			$('.Ctextbox3').css('border-color','gray');  
			$('.freetradeagreement3').css('border-bottom-color','gray'); 
        });
    	
        $('.freetradeagreement3').blur(function(){
            
    		if(textemail3 == ""){
    				
           	$(".warringmain3").show();
           	$('.Ctextbox3').css('border-color','red');
           	$('.freetradeagreement3').css('border-bottom-color','red');
    		} else{
    			
    			if(textemail3 != ""){

    			$(".warringmain3").hide();
    			$('.Ctextbox3').css('border-color','gray');  
    			$('.freetradeagreement3').css('border-bottom-color','gray');
    				}
    			 
    			}

    	 });	 

  //4
        var textemail4 = $(".freetradeagreement4").val();

        $(".freetradeagreement4").change(function(){
        	textemail4 = $(".freetradeagreement4").val();
        });
        	

            $('.freetradeagreement4').focus(function() {     
    			$(".warringmain4").hide();
    			$('.Ctextbox4').css('border-color','gray');  
    			$('.freetradeagreement4').css('border-bottom-color','gray');
            });
        	
            $('.freetradeagreement4').blur(function(){
                
        		if(textemail4 == ""){
        				
               	$(".warringmain4").show();
               	$('.Ctextbox4').css('border-color','red');
               	$('.freetradeagreement4').css('border-bottom-color','red');
        		} else{
        			
        			if(textemail4 != ""){

        			$(".warringmain4").hide();
        			$('.Ctextbox4').css('border-color','gray');  
        			$('.freetradeagreement4').css('border-bottom-color','gray');
        				}
        			 
        			}

        	 });

   //5
            var textemail5 = $(".freetradeagreement5").val();

            $(".freetradeagreement5").change(function(){
            	textemail5 = $(".freetradeagreement5").val();
            });
            	

                $('.freetradeagreement5').focus(function() {     
                	$(".warringmain5").hide();
        			$('.Ctextbox5').css('border-color','gray');  
        			$('.freetradeagreement5').css('border-bottom-color','gray');
                });
            	
                $('.freetradeagreement5').blur(function(){
                    
            		if(textemail5 == ""){
            				
                   	$(".warringmain5").show();
                   	$('.Ctextbox5').css('border-color','red');
                   	$('.freetradeagreement5').css('border-bottom-color','red');
            		} else{
            			
            			if(textemail5 != ""){

            			$(".warringmain5").hide();
            			$('.Ctextbox5').css('border-color','gray');  
            			$('.freetradeagreement5').css('border-bottom-color','gray');
            				}
            			 
            			}

            	 });

//----------------------------------------------------------------------------------------------
//광고문의 접수 저장
$(".submitbtn").click(function(){


	if(textemail =="" || textemail2 =="" || textemail3 =="" || textemail4 =="" || textemail5 ==""){
		
		alert("[error] 모든 항목을 입력해주시기 바랍니다.");
		
		}else{
			
		alert("[광고 문의를 접수하셨습니다.]")
		
		document.getElementById('common').submit(); 	
		}
	
});

</script>
</html>