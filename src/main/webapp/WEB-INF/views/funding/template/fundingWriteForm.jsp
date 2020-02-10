<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

		<form:form id="frm" modelAttribute="fundingVO">
			<div class="form-group">
		      <label for="name">Funding Name :</label>
		      <form:input placeholder="Enter name" class="form-control" path="name" id="name"/>
		      <form:errors path="name"></form:errors>
		    </div>
		    
			<div class="form-group">
		   <label for="contents">Funding Contents : </label>
		     <form:textarea placeholder="Enter contents" class="form-control" path="contents" id="contents"/>
		       <form:errors path="contents" cssClass="error"/>
			
			</div>
			 <div class="form-group">
		      <label for="people">Funding Price : </label>
		       <form:input placeholder="Enter price" class="form-control" path="price" id="price"/>
		       <form:errors path="price" cssClass="error"/>
		    </div>
			
		    <div class="form-group">
		      <label for="goal">Funding Goal : </label>
		      <form:input placeholder="Enter goal" class="form-control" path="goal" id="goal"/>
		      <form:errors path="goal" cssClass="error"/>
		    </div>
		    
		    <div class="form-group">
		      <label for="id">Funding ID : </label>
		      <form:input class="form-control" path="id"  value="${member.id}" id="id"/>
		      <form:errors path="id" cssClass="error"/>
		    </div>
			
			<div class="form-group">
		      <label for="startTime">Funding StartTime : </label>
		      <input type="date" class="form-control" min="2020-02-17" id="start" name="start"/>
		      <input type="time" class="form-control" name="time1" id="time1"/>
		    </div>
		    
		    <div class="form-group">
		      <label for="endTime">Funding EndTime : </label>
		     <input type="date" class="form-control" min="2020-02-18" id="end" name="end"/>
		      <input type="time" class="form-control" name="time2" id="time2"/>
		    </div>

		     <div class="row" style="margin-top: 50px;">
		 	<!-- <input type="submit" id="write" class="btn btn-success col-sm-3" value="Write"> -->
			<input type="button" id="write" class="btn btn-success col-sm-3" value="Write">
		   	<input type="button" id="re" class="btn btn-primary col-sm-3" value="back">
		   	</div> 
		</form:form>