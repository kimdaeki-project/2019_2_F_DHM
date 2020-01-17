<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- date -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<div class="form-group">
		      <label for="startTime">Funding StartTime : </label>
		      <input type="button" class="form-control" id="start" name="start"/>
		      <input type="time" class="form-control" name="time1"/>
		    </div>
		    
		    <div class="form-group">
		      <label for="endTime">Funding EndTime : </label>
		     <input type="button" class="form-control" id="end" name="end"/>
		      <input type="time" class="form-control" name="time2"/>
		    </div>