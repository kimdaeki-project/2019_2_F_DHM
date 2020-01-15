<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

		<form:form id="frm" modelAttribute="fundingVO">
			<div class="form-group">
		      <label for="name">Funding Name :</label>
		      <form:input  class="form-control" path="name"/>
		      <form:errors path="name"></form:errors>
		    </div>
		    
			<div class="form-group">
		    <label for="contents">Funding Contents : </label>
			<form:textarea cssClass="form-control" path="contents" id="contents"/>
			<form:errors  path="contents" cssClass="error"/>
			</div>
		
		    <div class="form-group">
		      <label for="goal">Funding Goal : </label>
		      <form:input placeholder="Enter goal" class="form-control" path="goal"/>
		      <form:errors path="goal" cssClass="error"/>
		    </div>
		    
		    <div class="form-group">
		      <label for="id">Funding ID : </label>
		      <form:input class="form-control" path="id"  value="${member.id}"/>
		      <form:errors path="id" cssClass="error"/>
		    </div>
			
			<div class="form-group">
		      <label for="startTime">Funding StartTime : </label>
		      <input type="date" min="2020-01-15" class="form-control" name="start"/>
		      <input type="time" class="form-control" name="time1"/>
		    </div>
		    
		    <div class="form-group">
		      <label for="endTime">Funding EndTime : </label>
		     <input type="date" min="2020-01-16" class="form-control" name="end"/>
		      <input type="time" class="form-control" name="time2"/>
		    </div>
		    
		    <div class="form-group">
		      <label for="people">Funding People : </label>
		       <form:input class="form-control" path="people"/>
		       <form:errors path="people" cssClass="error"/>
		    </div>
			
		     <div class="row" style="margin-top: 50px;">
		    <input type="button" id="write" class="btn btn-danger col-sm-3" value="Write">
		   	</div> 
		</form:form>