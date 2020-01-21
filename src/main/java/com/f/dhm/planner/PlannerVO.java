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
	private int pStep;
	private int pNum;
	//@NotEmpty
	private String id;
	private String title;
	private String type;
	private Date dDate;
	private Date aDate;
	private int bak;
	private String region;
	private String transfer;
	private int totalCost;
	public int getpStep() {
		return pStep;
	}
	public void setpStep(int pStep) {
		this.pStep = pStep;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public Date getdDate() {
		return dDate;
	}
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	public Date getaDate() {
		return aDate;
	}
	public void setaDate(Date aDate) {
		this.aDate = aDate;
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
