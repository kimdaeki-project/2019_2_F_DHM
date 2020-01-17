package com.f.dhm.schedule;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "schedule")
public class ScheduleVO {
	@Id
	private int sNum;
	@NotEmpty
	private int pNum;
	@NotEmpty
	private String sName; //스케줄이름
	@NotEmpty
	private String tour; //관광지이름

	private int cost;	
	private Date start;
	private Date end;
	private String transfer;
}
