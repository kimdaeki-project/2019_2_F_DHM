package com.f.dhm.qna;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

@Data
public class QnaVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	@NotEmpty(message = "제목을 입력해 주세요")
	private String title;
	private String contents;
	private String id;
	@CreationTimestamp
	private Date regDate;
	@UpdateTimestamp
	private Date upDate;

	
	private int hit;
	private int ref;
	private int step;
	private int depth;
}
