package com.f.dhm.planner;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

import lombok.Data;


@Data
@Entity
@Table(name = "planner")
public class PlannerVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer plStep;
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
	@Transient
	private int days;
	
	private int arCode;
	private Integer polyPath;
	
}
