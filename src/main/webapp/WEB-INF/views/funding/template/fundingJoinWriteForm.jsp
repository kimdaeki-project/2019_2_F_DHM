<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

		<form:form id="frm" modelAttribute="fundingVO">
			<div class="form-group">
			<input type="hidden" name="fNum" value="${vo.num}">
		      <label for="name">Funding Name :</label>
		     <br><span class="">
				${vo.name}
			</span>
		    </div>
		    
			<div class="form-group">
		    <label for="contents">Funding Contents : </label>
			<span class="">
				${vo.contents}
			</span>
			</div>
		
		    <div class="form-group">
		      <label for="price">Funding Price : </label>
		      <input type="hidden" name="price" value="${vo.price}">
		     <br><span class="">
		     	${vo.price}
		     </span>
		    </div>
		    
		    <div class="form-group">
		      <label for="id">Funding ID : </label>
		       <input type="text" class="form-control" name="id" value="${vo.id}">
		     <%-- <br><span class="">
		     	${vo.id}
		     </span> --%>
		    </div>
			
			<div class="form-group">
		      <label for="startTime">Funding StartTime : </label>
		     <%--  <input type="datetime" class="form-control" name="start" value="${vo.startTime}" readonly="readonly"/> --%>
		      <span class="">
				${vo.startTime}
			</span>
		    </div>
		    
		    <div class="form-group">
		      <label for="endTime">Funding EndTime : </label>
		     <%-- <input type="datetime" class="form-control" name="end" value="${vo.endTime}" readonly="readonly"/> --%>
		     <span class="">
				${vo.endTime}
			</span>
		    </div>
		    
		    <div class="form-group">
		      <label for="people">Funding People : </label>
		       <form:input class="form-control" path="participationPeople" id="participationPeople"/>
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
/* var goal = ${vo.goal};		
var price = ${vo.price};
var people = $("#participationPeople").val;
var gage = (price * people) / goal;
	document.getElementById('gage').innerHTML = gage; */
		
$("#participation").click(function() {
	/* alert($("#participationPeople").val()); */
	if($("#participationPeople").val() == ""){
		alert("펀딩에 참여할 인원을 입력해주세요.");
	}else {
		$("#frm").submit();
	}
});
$("#re").click(function(){
	location.href= "./fundingList";
	});
</script>
