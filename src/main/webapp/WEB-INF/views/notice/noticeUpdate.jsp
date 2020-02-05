<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Write</title>
<c:import url="../template/boot.jsp"/>
<link rel="stylesheet"  href="../css/basic.css">
</head>
<body>
<c:import url="../template/nav.jsp"/>
<div class="container">
	<article>
	<h1>Notice Update</h1>
			<form:form action="noticeUpdate" modelAttribute="noticeVO" method="post" enctype="multipart/form-data">
				<div class="form-group">
				<label for="usr">title:</label> 
				<form:input	class="form-control" path="title"/>
<%-- 				<form:errors path="title" /> --%>
			</div>
			<div class="form-group">
				<label for="usr">contents:</label>
				 <form:textarea path="contents" class="contents"/>
<%-- 				 <form:errors path="contents" /> --%>
			</div>
			<c:if test="${!empty noticeVO.noticeFilesVOs}">
					<div class="boardSelectFiles">
						<ul class="boardSelectFiles_ul">
							<li class="boardSelectFiles_li boardSelectFiles_title">첨부파일</li>
						<c:forEach items="${noticeVO.noticeFilesVOs}" var="files">
							<li class="boardSelectFiles_li paddingLeft20px" >
								<span class="x"><b>x</b> <a href="#" class="fileLink">${files.oname}</a><b class="fileNum" hidden="hidden">${files.fnum}</b></span>
							</li>
						</c:forEach>
						</ul>
							 <br>
					</div>
				</c:if>
			<form:input path="num" class="displayNone"/>
			<form:input path="id" class="displayNone"/>
			<div class="fileDiv">
				<div>
						
				</div>
			</div>
			<input type="button" value="plus files" id="filePlus">
			<div class="float_right"><button class="button2">submit</button></div>
			</form:form>
		</article>
</div>
	<div style="height: 200px; background: gold; margin-top: 100px;">footer</div>


<script>
$('.contents').summernote({
    placeholder: 'write contents!',
    tabsize: 2,
    height: 500
  });

var count=0;

$('#filePlus').click(function(){
	if(count==5){
		alert('더이상 파일을 추가할 수 없습니다.')}
	else{
	count++;
	$('.fileDiv').append('<input type="file" class="inputFile" name="files"> ');
		}
});

$('.x').click(function(){
	var fileName=$(this).find('.fileNum').text();

	alert(fileName);
	//ajax
	$.ajax({
		url : "./notice_file_delete",
		type : "GET",
		data:{
			fileName: fileName
			},
		success:function(){
			alert(fileName+'success!!')

			}
		});
});
  </script>
</body>
</html>