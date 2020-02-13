package com.f.dhm.schedule;


import javax.persistence.Entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheduleInfoVO {
	
	//scheVO
	private String scName; //스케줄이름
	private String tour; //관광지이름
	private Integer cost;
	private Integer start;
	private Integer arCode;
	//wishVO
	private String title;
	private String firstimage;
	private String addr1;
}



