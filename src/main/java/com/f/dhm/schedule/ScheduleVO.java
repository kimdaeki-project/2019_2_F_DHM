package com.f.dhm.schedule;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "schedule")
public class ScheduleVO {
	@Id
	private int scNum;
	@NotEmpty
	private int plNum;
	@NotEmpty
	private String scName; //스케줄이름
	@NotEmpty
	private String tour; //관광지이름

	private int cost;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "")
	private Date start;
	private Date end;
	private String transfer;
}
