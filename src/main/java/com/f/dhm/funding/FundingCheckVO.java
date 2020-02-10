package com.f.dhm.funding;

import javax.persistence.Entity;

import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class FundingCheckVO {
	
	@Id
	private int fNum;
	private int participationPeople;
	private int price;
	private int total;
	private String id;
}
