<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div >
<c:if test="${count ne 1 }">
			<div class="mkp-trans-info" >
				<div style="padding-top:0px;padding-bottom:0px">
					<div style="float:left;width:29px;height:40px;border-right:3px solid #3ad195;">&nbsp;</div>
					<div style="float:left;width:150px;height:40px;padding-top:10px;margin-left:-25px;">
						<div class="mkp-trans-btn">
							<font style="font-size:9pt;color:#fff"><span class="mkp-trans-chos">선택&nbsp;</span><i class="fa fa-chevron-circle-down"></i></font>
								<div class="mkp-trans-picker">
									<div class="mkp-trans-sct">
										<i class="fa fa-bus"></i>
										<font>버스</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-taxi"></i>
										<font>택시</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-train"></i>
										<font>기차</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-car"></i>
										<font>자차</font>
									</div>
									<div class="mkp-trans-sct">
										<i class="fa fa-plane"></i>
										<font>항공</font>
									</div>
								</div>
						</div>&nbsp;
					</div>
					
					<div style="clear:both"> </div>
				</div>
			</div> 
</c:if>			
			<div class="mkp-city-info" id="c${count}" title="${index }">
				<div class="city-menu-left">
					<div style="width:29px;border-right:3px solid #3ad195;height:7px;"> </div>
					<div>
						<div class="mkp-city-one" >
								<a class="click-sleep" title="c${count }" id="${cityName}" >
								<font style="color:#696969;font-size:10pt;font-weight:bold" class="nights"> <span class="nights-day">1</span>박  
									<i class="fa fa-angle-down"></i>
								</font>
							</a>
						</div> 
					</div>
					<div style="width:29px;border-right:3px solid #3ad195;height:7px;clear: both;"> </div>
				</div>
				<div class="city-menu-right">
					<div class="mkp-city-name">
						<span class="city-sel-name">${cityName }</span>
						<i class="fa fa-times-circle city-del"  style="cursor: pointer;"></i>
						<p class="mkp-city-date"> 
							<span class="sDate">${startDate }</span>
							~ 
							<span class="eDate"> ${endDate }</span>
						</p>
					</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					<div class="open-ifm" >
						<div class="ifm-info"><i class="fa fa-calendar-check-o"></i></div>
						<div class="ifm-opener">
							<p><span>${cityName }</span>에서 경험하고 싶은 것들을 선택해보세염<span style="float: right; font-size: 20px; cursor: pointer;" class="ifm-closer"><i class="fa fa-times-circle"></i></span></p>
							<iframe src="http://localhost/planner/ifmOpen?arCode=${arCode}"></iframe>
						</div>
					</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				</div>
			</div>
</div>