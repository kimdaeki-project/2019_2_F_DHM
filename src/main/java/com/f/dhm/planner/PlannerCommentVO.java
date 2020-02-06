package com.f.dhm.planner;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.CreationTimestamp;
import lombok.Data;

@Entity
@Table(name = "pComment")
@Data
public class PlannerCommentVO {
	//	Table: pComment
	//	Columns:
		
	//	cNum int PK 
	//	id varchar(45) 
	//	title varchar(45) 
	//	contents text 
	//	regDate datetime 
	//	plNum int
	
	@Id
	@GeneratedValue(generator = "cNum", strategy = GenerationType.IDENTITY)
	private int cNum;
	private String id;
	private String contents;
	@CreationTimestamp
	private Date regDate;
	@ManyToOne
	@JoinColumn(name = "plNum")
	private PlannerVO plannerVO;
	

}
