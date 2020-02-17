package com.f.dhm.schedule;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int scNum;
	//@NotEmpty
	private Integer plNum;
	@NotEmpty
	private String scName; //스케줄이름
	@NotEmpty
	private String tour; //관광지이름

	private Integer cost;
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "")
	private Integer start;

	private String day;

	private String transfer;
	private Integer arCode;


}
