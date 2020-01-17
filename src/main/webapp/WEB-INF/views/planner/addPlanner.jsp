<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<div class="mkp-city-info" id="c${count}" >
				<div class="city-menu-left">
					<div style="width:29px;border-right:3px solid #3ad195;height:7px;"> </div>
					<div>
						<div class="mkp-city-one" >
							<a onclick="showModal('${cityName}','c${count}')" >
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
						<i class="fa fa-times-circle city-del" style="cursor: pointer;"></i>
						<p class="mkp-city-date"> <span class="sDate">${startDate } </span>  ~ <span class="eDate"> ${endDate }</span></p>
					</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					<div class="open-ifm" >
						<div class="ifm-info"><i class="fa fa-calendar-check-o"></i></div>
						<div class="ifm-opener">
							<p><span>${cityName }</span>에서 경험하고 싶은 것들을 선택해보세염<span style="float: right; font-size: 20px; cursor: pointer;" class="ifm-closer"><i class="fa fa-times-circle"></i></span></p>
							<iframe src="http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/galleryList?ServiceKey=KkW8cDTbMiDD70xS%2BpXe9JiQvVMyBa5TFeUylgBKuPAxfGxwOz4azNwFlyoQCuLua9hNxhoajrMdw8XV5pjo7w%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json"></iframe>
						</div>
					</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				</div>
			</div>