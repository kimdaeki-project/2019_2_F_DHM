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
		<h1>review update</h1>
		
			<form action="reviewUpdate" method="post">
				<div class="reviewBox">				
						<div class="reviewMemberImg">
							<!-- /////////////////////////////////////////////////////////////////////// -->
							<img alt="members_img" src="../images/user.jpg" class="reviewMemberImg_img">
							<!-- /////////////////////////////////////////////////////////////////////// -->
						</div>
						<div class="reviewCommentsWrapper">
							<h5 class="reviewComments_header_info">
								<span>${commentVO.id }</span>
								<span class="reviewComments_header_date">${commentVO.regDate }</span>								
							</h5>
							<textarea class="contents" name="contents">${commentVO.contents }</textarea>
						</div>
					</div>
		<div class="reviewBox">	<button class="button2">submit</button></div>
			</form>
		
	</div>
	
	
	<!-- reviewBox -->
					
					<!-- reviewBox -->
	<script type="text/javascript">
	$('.contents').summernote({
		placeholder : 'write contents!',
		tabsize : 2,
		height : 150
	});

</script>
</body>
</html>