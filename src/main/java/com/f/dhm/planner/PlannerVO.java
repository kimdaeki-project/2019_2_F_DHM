package com.f.dhm.planner;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import lombok.Data;


@Data
@Entity
@Table(name = "planner")
public class PlannerVO {
	
	@Id
	private int plStep;
	private int plNum;
	@NotEmpty
	private String id;
	private String title;
	private String type;
	private int people;
	private Date deDate;
	private Date arDate;
	private int bak;
	private String region;
	private String transfer;
	private int totalCost;
	
	
	
}
