<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

		<form:form id="frm" modelAttribute="fundingVO">
			<div class="form-group">
		      <label for="fName">Funding Name :</label>
		      <form:input  class="form-control" path="fName"/>
		      <form:errors path="fName"></form:errors>
		    </div>
		    
			<div class="form-group">
		    <label for="contents">Funding Contents : </label>
			<form:textarea cssClass="form-control" path="contents" id="contents"/>
			<form:errors cssClass="" path="contents"></form:errors>
			</div>
		
		    <div class="form-group">
		      <label for="goal">Funding Goal : </label>
		      <form:input placeholder="Enter goal" class="form-control" path="goal"/>
		      <form:errors path="goal" cssClass="error"></form:errors>
		    </div>
		    
		    <div class="form-group">
		      <label for="goal">Funding ID : </label>
		      <form:input class="form-control" path="id"  value="${member.id}"/>
		      <form:errors path="id" cssClass="error"></form:errors>
		    </div>
			
			<div class="form-group">
		      <label for="goal">Funding StartTime : </label>
		      <input type="date" class="form-control" name="startTime" id="startTime"/>
		    </div>
		    
		    <div class="form-group">
		      <label for="goal">Funding EndTime : </label>
		      <input type="date" class="form-control" name="endTime" id="endTime"/>
		    </div>
			
		     <div class="row" style="margin-top: 50px;">
		    <input type="button" id="write" class="btn btn-danger col-sm-3" value="Write">
		   	</div> 
		</form:form>