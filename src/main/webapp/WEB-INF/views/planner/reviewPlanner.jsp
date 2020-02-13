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
	
		<h1 style="color: #c9c9c9; border-bottom: 1px solid #c9c9c9; padding-bottom: 10px;">review</h1>
		<div class="section" style="background: gold;">
			<div class="reviewFlexWrapper">
				<div class="reviewWrapper_leftSide">
					
					<c:forEach items="${commentVOs }" var="comments">
					<!-- reviewBox -->
					<div class="reviewBox ">
						<div class="reviewMemberImg"><img alt="members_img" src="../images/pixel.jpg" class="reviewMemberImg_img"></div>
						<div class="reviewCommentsWrapper">
							<h5 class="reviewComments_header_info">
								<span>${comments.id } </span>
								<span class="reviewComments_header_date">${comments.regDate }</span>
								<span style="float: right;"><a style="color: #999;" href="./reviewUpdate?cNum=${comments.CNum}">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;<b><a style="color: #999;" href="reviewDelete?cNum=${comments.CNum}">x</a></b></span>
							</h5>
							<div class="reviewComments_comments">${comments.contents }</div>
<%-- 							<textarea class="reviewComments_comments" >${comments.contents }</textarea> --%>
						</div>
					</div>
					<!-- reviewBox -->
					</c:forEach>
					
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
					<input type="text" name="plNum" value="52" class="displayNone">
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