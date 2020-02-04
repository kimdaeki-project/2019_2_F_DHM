package com.f.dhm.planner;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.CreationTimestamp;
import lombok.Data;

@Entity
@Table(name = "pComment")
@Data
public class PlannerCommentVO {

	@Id
	private int plNum;
	private String id;
	private String title;
	private String contents;
	@CreationTimestamp
	private Date regDate;
}
