package com.f.dhm.funding;

import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	private int pNum;
	@NotEmpty
	@Column(name = "fName")
	private String name;
	@NotEmpty
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
	@Column(name = "participationPeople")
	private BigInteger partPeople;

}
