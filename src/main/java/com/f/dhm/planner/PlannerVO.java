package com.f.dhm.planner;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Setter
@Entity
@Table(name = "planner")
public class PlannerVO {
	
	@Id
	private int plStep;
	private int plNum;
	//@NotEmpty
	private String id;
	private String title;
	private String type;
	private Date deDate;
	private Date arDate;
	private int bak;
	private String region;
	private String transfer;
	private int totalCost;
	
	public int getPlStep() {
		return plStep;
	}
	public int getPlNum() {
		return plNum;
	}
	public String getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getType() {
		return type;
	}
	public Date getDeDate() {
		return deDate;
	}
	public Date getArDate() {
		return arDate;
	}
	public int getBak() {
		return bak;
	}
	public String getRegion() {
		return region;
	}
	public String getTransfer() {
		return transfer;
	}
	public int getTotalCost() {
		return totalCost;
	}
	
	
}
