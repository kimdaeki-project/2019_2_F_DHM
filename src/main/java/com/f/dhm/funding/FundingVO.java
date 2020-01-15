package com.f.dhm.funding;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
@Table(name = "funding")
public class FundingVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fNum;
	private int pNum;
	@NotEmpty
	private String fName;
	@NotEmpty
	private String contents;
	@NotEmpty
	private int goal;
	private int status;
	private String id;
	@CreationTimestamp
	private java.util.Date startTime;
	private java.util.Date endTime;
	private int people;

}
