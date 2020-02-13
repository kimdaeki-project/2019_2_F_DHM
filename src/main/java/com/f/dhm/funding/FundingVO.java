package com.f.dhm.funding;

import java.math.BigInteger;
import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
@Table(name = "funding")
public class FundingVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "fNum")
	private int num;
	private Integer plNum;
	@NotEmpty
	@Column(name = "fName")
	private String name;
	
	private String contents;
	@NotNull
	private BigInteger goal;
	private int status;
	private String id;
	private java.util.Date startTime;
	private java.util.Date endTime;
	@NotNull
	private int people;
	@NotNull
	private BigInteger price;
	private int participationPeople;
	private int restTime;
	private double gage;

	@CreationTimestamp
	private java.util.Date regDate;
	
	@OneToMany(mappedBy = "fundingVO", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<FundingJoinVO> fundingJoinVOs;
	

	
}
