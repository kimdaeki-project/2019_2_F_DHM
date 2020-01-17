package com.f.dhm.planner;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "planner")
public class PlannerVO {
	
	@Id
	private int pStep;
	private int pNum;
	@NotEmpty
	private String id;
	private String title;
	private String type;
	private Date dDate;
	private Date aDate;
	private String bak;
	private String region;
	private String transfer;
	private int totalCost;
	
	
}
