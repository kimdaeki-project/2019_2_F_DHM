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
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

@Entity
@Table(name = "pComment")
@Data
public class PlannerCommentVO {
	
	@Id
	@GeneratedValue(generator = "cNum", strategy = GenerationType.IDENTITY)
	private int cNum;
	private String id;
	private String contents;
	@UpdateTimestamp
	private Date regDate;

	private int plNum;
	

}
