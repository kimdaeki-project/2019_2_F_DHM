package com.f.dhm.funding;

import java.math.BigInteger;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "fundingJoin")
public class FundingJoinVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
//	private int fNum;
	private String id;
	private String participationId;
	private BigInteger price;
	private BigInteger total;
	private int participationPeople;
	
	@ManyToOne
	@JoinColumn(name = "fNum")
	private FundingVO fundingVO;
}
