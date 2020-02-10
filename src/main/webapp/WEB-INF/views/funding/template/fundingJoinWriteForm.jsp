<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.form-group{
font-size: 30px;
}
</style>
		<form:form id="frm" modelAttribute="fundingVO">
			<div class="form-group">
			<input type="hidden" name="fNum" value="${vo.num}">
				<span style="font-size: 30px; font-weight: bold;">${vo.name}</span>
		    </div>
		    
			<div class="form-group">
			<span class="">
				${vo.contents}
			</span>
			</div>
		
		       <input type="hidden" class="form-control" name="id" value="${vo.id}">
<%-- 		    <div class="form-group">
		      <label for="id">펀딩하는 아이디 : </label>
		       ${vo.id}
		    </div>
 --%>
		    <div class="form-group">
		      <input type="hidden" name="price" value="${vo.price}">
		      <label for="price">금액 : </label>
		     <span id="price">
		     	${vo.price}
		     </span>원
		    </div>		    
			
			<div class="form-group">
		      <label for="startTime">여행 시작 시간 : </label>
		     <%--  <input type="datetime" class="form-control" name="start" value="${vo.startTime}" readonly="readonly"/> --%>
		      <span id="startTime">
			</span>
		    </div>
		    
		    <div class="form-group">
		      <label for="endTime">여행 마침 시간 : </label>
		     <%-- <input type="datetime" class="form-control" name="end" value="${vo.endTime}" readonly="readonly"/> --%>
		    <span id="endTime">
			</span>
		    </div>
		    
		    <div class="form-group">
		      <label for="people">참여 인원 : </label>
		       <form:input class="form-control" path="participationPeople" id="participationPeople" placeholder="펀딩에 참여할 인원을 입력해주세요."/>
		       <form:errors path="participationPeople" cssClass="error"/>
		    </div>
			<input type="hidden" name="goal" value="${vo.goal}">
			<input type="hidden" name="status" value="${vo.status}">
			<input type="hidden" name="gage" value="${vo.gage}">
		     <div class="row" style="margin-top: 50px;">
		    <input type="button" id="participation" class="btn btn-success col-sm-3" value="participation">
		    <!-- <button type="submit" class="btn btn-success col-sm-3">Participation</button> -->
		    <input type="button" id="re" class="btn btn-primary col-sm-3" value="Back">
		   	</div> 
		</form:form>
<script type="text/javascript">
var price = ${vo.price};
price = price.toLocaleString();
document.getElementById('price').innerHTML = price;

var startTime = '${vo.startTime}';
var endTime = '${vo.endTime}';

var start = startTime.substring(0, 16);
var end = endTime.substring(0, 16);

document.getElementById('startTime').innerHTML = start;
document.getElementById('endTime').innerHTML = end;

$("#participation").click(function() {
	if($("#participationPeople").val() == "" || $("#participationPeople").val() == "0"){
		alert("펀딩에 참여할 인원을 입력해주세요.");
		$("#participationPeople").focus();
	}else {
		$("#frm").submit();
	}
});
$("#re").click(function(){
	location.href= "./fundingList";
	});
</script>
